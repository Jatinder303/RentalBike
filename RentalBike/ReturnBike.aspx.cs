using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RentalBike.Business;

namespace RentalBike
{
    public partial class ReturnBike : System.Web.UI.Page
    {
        public object Rent_BAL { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx?msg=Please Login to enter in to system.");
            }
            if (!IsPostBack)
            {
                FillRentDetails();
               
            }
        }

        private void FillRentDetails()
        {
            Rental_BAL Obj_rental = new Rental_BAL();
            List<Rent> Obj_Rent_ID = Obj_rental.GetRentalData();

            if (Obj_Rent_ID != null && Obj_Rent_ID.Count > 0)
            {
                for (int i = 0; i < Obj_Rent_ID.Count; i++)
                {
                    ddl_RentID.Items.Add(Obj_Rent_ID[i].RentID.ToString());
                }
                ddl_RentID.Items.Insert(0, new ListItem("Select Rental ID", " "));
            }
            else
            {
                ddl_RentID.Items.Clear();
            }
        }

        protected void ddl_Rent_SelectedIndexChanged(object sender, EventArgs e)
        {
            decimal bikeRent=0;
            List<Rent> Obj_Rent = Rental_BAL.GetRentDetails(ddl_RentID.SelectedValue);
            if (Obj_Rent != null && Obj_Rent.Count > 0)
            {
                for (int i = 0; i < Obj_Rent.Count; i++)
                {
                    List<Customer> Obj_Customer = Customer_BAL.GetCustomerDetails(Obj_Rent[i].CustomerID.ToString());
                    if (Obj_Customer != null && Obj_Customer.Count > 0)
                    {
                        for (int k = 0; k < Obj_Customer.Count; k++)
                        {
                            txtCustomerName.Text = Obj_Customer[k].FirstName;
                        }
                    }

                    List<Bike> Obj_Bike = Bike_BAL.GetBikeDetails(Obj_Rent[i].BikeID.ToString());
                    if (Obj_Bike != null && Obj_Bike.Count > 0)
                    {
                        for (int j = 0; j < Obj_Bike.Count; j++)
                        {
                            txtBikeModel.Text = Obj_Bike[j].Model;
                            bikeRent = Convert.ToDecimal(Obj_Bike[j].RentPerDay);
                        }
                    }
                    txtIssueDate.Text = Obj_Rent[i].IssueDate.ToString();
                    txtReturnDate.Text = DateTime.Now.ToString();
                    DateTime issuedate = Convert.ToDateTime(Obj_Rent[i].IssueDate);
                    double days = (DateTime.Now -issuedate).TotalDays;
                    txtTotalRent.Text = (bikeRent*Convert.ToDecimal(Math.Round(days))).ToString();
                }
            }
        }

       

        protected void Return_btn_Click(object sender, EventArgs e)
        {
            Rental_BAL.DeleteIssue(ddl_RentID.SelectedValue);
            Returned Obj_Returned_Bike = new Returned
            {
                RentID = Convert.ToInt32(ddl_RentID.SelectedValue),
                CustomerName = txtCustomerName.Text,
                BikeModel = txtBikeModel.Text,
                IssueDate = Convert.ToDateTime(txtIssueDate.Text),
                ReturnDate = Convert.ToDateTime(txtReturnDate.Text),
                TotalRent = Convert.ToDecimal(txtTotalRent.Text)
            };
            Rental_BAL.InsertReturnedBike(Obj_Returned_Bike);
            Response.Redirect("default.aspx");
        }

       
    }
}