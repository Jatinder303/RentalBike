using RentalBike.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentalBike
{
    public partial class RentBike : System.Web.UI.Page
    {
        CustomerUpdate Obj_Cust_ddl_Data = new CustomerUpdate();
        BikeUpdate Obj_Bike_ddl_Date = new BikeUpdate();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx?msg=Please Login to enter in to system.");
            }
            if (!IsPostBack)
            {
               FillCustomerDetails();
               FillBikeDetails();
            }
        }

        private void FillCustomerDetails()
        {
            Customer_BAL Obj_Cust = new Customer_BAL();
            List<Customer> Obj_Customer_ID = Obj_Cust.GetCustomerData();

            if (Obj_Customer_ID != null && Obj_Customer_ID.Count > 0)
            {
                for (int i = 0; i < Obj_Customer_ID.Count; i++)
                {
                    ddl_Customer.Items.Add(Obj_Customer_ID[i].CustomerID.ToString());
                }
                ddl_Customer.Items.Insert(0, new ListItem("Select Customer", " "));
            }
            else
            {
                ddl_Customer.Items.Clear();
            }
        }

        private void FillBikeDetails()
        {
            Bike_BAL Obj_Cust = new Bike_BAL();
            List<Bike> Obj_Bike_ID = Obj_Cust.GetBikeData();

            if (Obj_Bike_ID != null && Obj_Bike_ID.Count > 0)
            {
                for (int i = 0; i < Obj_Bike_ID.Count; i++)
                {

                    ddl_Bike.Items.Add(Obj_Bike_ID[i].BikeID.ToString());
                }
                ddl_Bike.Items.Insert(0, new ListItem("Select Bike", " "));
            }
            else
            {
                ddl_Bike.Items.Clear();
            }
        }
        protected void ddl_Customer_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Customer> Obj_Customer = Customer_BAL.GetCustomerDetails(ddl_Customer.SelectedValue);
            if (Obj_Customer != null && Obj_Customer.Count > 0)
            {
                for (int i = 0; i < Obj_Customer.Count; i++)
                {
                    txtFirstName.Text = Obj_Customer[i].FirstName;
                }
            }
        }

        protected void ddl_Bike_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Bike> Obj_Bike = Bike_BAL.GetBikeDetails(ddl_Bike.SelectedValue);
            if (Obj_Bike != null && Obj_Bike.Count > 0)
            {
                for (int i = 0; i < Obj_Bike.Count; i++)
                {
                    txtBikeModel.Text = Obj_Bike[i].Model;
                }
            }

        }

        protected void Issue_btn_Click(object sender, EventArgs e)
        {
            DateTime IssueDate = Convert.ToDateTime(txtIssueDate.Text);

            double days = (DateTime.Now - IssueDate).TotalDays;

            if (days>=0)
            {
                Rent Obj_Ins_Rent = new Rent
                {
                    CustomerID = Convert.ToInt32(ddl_Customer.SelectedValue),
                    BikeID = Convert.ToInt32(ddl_Bike.SelectedValue),
                    IssueDate = Convert.ToDateTime(txtIssueDate.Text)
                };
                Rental_BAL.InsertRent(Obj_Ins_Rent);
                Response.Redirect("default.aspx");
            }
            else
            {
                MessageIssue.Text = "Issue date can not grater than Today's Date.";
            }
        }
            
       
    }
}