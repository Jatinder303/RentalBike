using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentalBike
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx?msg=Please Login to enter in to system.");
            }
            else
            {
                Customer_Fill();
                Bike_Fill();
                Rental_Fill();
                Returned_Fill();
            }
       
        }

        private void Customer_Fill()
            {
                Business.Customer_BAL Obj_Cust = new Business.Customer_BAL();
                List<Customer> Obj_Customer = Obj_Cust.GetCustomerData();
                if (Obj_Customer != null && Obj_Customer.Count > 0)
                    {
                        gvCustomer.DataSource = Obj_Customer;
                        gvCustomer.DataBind();
                    }
            else
            {
                gvCustomer.DataSource = null;
                gvCustomer.DataBind();
            }
        }

        private void Bike_Fill()
        {
            Business.Bike_BAL Obj_Bike = new Business.Bike_BAL();
            List<Bike> Obj_BikeList = Obj_Bike.GetBikeData();
            if (Obj_BikeList != null && Obj_BikeList.Count > 0)
            {
                gvBike.DataSource = Obj_BikeList;
                gvBike.DataBind();
            }
            else
            {
                gvBike.DataSource = null;
                gvBike.DataBind();
            }
        }
        private void Rental_Fill()
        {
            Business.Rental_BAL Obj_Rent = new Business.Rental_BAL();
            List<Rent> Obj_Rental = Obj_Rent.GetRentalData();
            if (Obj_Rental != null && Obj_Rental.Count > 0)
            {
                gvRent.DataSource = Obj_Rental;
                gvRent.DataBind();
            }
            else
            {
                gvRent.DataSource = null;
                gvRent.DataBind();
            }
        }

        private void Returned_Fill()
        {
            Business.Rental_BAL Obj_Return = new Business.Rental_BAL();
            List<Returned> Obj_Returned = Obj_Return.GetReturnedData();
            if (Obj_Returned != null && Obj_Returned.Count > 0)
            {
                gvReturned.DataSource = Obj_Returned;
                gvReturned.DataBind();
            }
            else
            {
                gvReturned.DataSource = null;
                gvReturned.DataBind();
            }
        }
    }
}