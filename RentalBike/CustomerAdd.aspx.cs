using RentalBike.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentalBike
{
    public partial class CustomerAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["UserID"] == null)
              {
                  Response.Redirect("Login.aspx?msg=Please Login to enter in to system.");
              }
        }

        protected void Insert_btn_Click(object sender, EventArgs e)
        {
            Customer Obj_Ins_Cust = new Customer
            {
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                Address = txtAddress.Text,
                Phone = txtPhone.Text,
                LicenseNo = txtLicenseNo.Text
            };
            Customer_BAL.InsertCustomer(Obj_Ins_Cust);
            Response.Redirect("default.aspx");
        }
    }
}