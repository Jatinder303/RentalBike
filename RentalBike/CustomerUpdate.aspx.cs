using RentalBike.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentalBike
{
    public partial class CustomerUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["UserID"] == null)
             {
                 Response.Redirect("Login.aspx?msg=Please Login to enter in to system.");
             }
            if (!IsPostBack)
            {
                FillCustomerDetails();
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
                    txtLastName.Text = Obj_Customer[i].LastName;
                    txtAddress.Text = Obj_Customer[i].Address;
                    txtPhone.Text = Obj_Customer[i].Phone;
                    txtLicenseNo.Text = Obj_Customer[i].LicenseNo;
                }
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
        protected void Update_btn_Click(object sender, EventArgs e)
        {
            Customer Obj_Ins_Cust = new Customer
            {
                CustomerID = Convert.ToInt32(ddl_Customer.SelectedValue),
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                Address = txtAddress.Text,
                Phone = txtPhone.Text,
                LicenseNo = txtLicenseNo.Text
            };
            Customer_BAL.UpdateCustomer(Obj_Ins_Cust);
            Response.Redirect("default.aspx");
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
           Customer_BAL.DeletCustomer(ddl_Customer.SelectedValue);
            Response.Redirect("default.aspx");
        }

     
    }
}