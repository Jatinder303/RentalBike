using RentalBike.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentalBike
{
    public partial class BikeAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx?msg=Please Login to enter in to system.");
            }
        }

        protected void InsertBike_btn_Click(object sender, EventArgs e)
        {
            Bike Obj_Int_Bike = new Bike
            {
                Model = txtBikeModel.Text,
                Maker = txtBikeMaker.Text,
                RegistrationNumber = txtRegistrationNumber.Text,
                RentPerDay= Convert.ToDecimal(txtRentPerDay.Text)
            };
            Bike_BAL.InsertBike(Obj_Int_Bike);
            Response.Redirect("default.aspx");
        }
    }

   
}