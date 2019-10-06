using RentalBike.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentalBike
{
    public partial class BikeUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx?msg=Please Login to enter in to system.");
            }
            if (!IsPostBack)
            {
                FillBikeDetails();
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
                    txtBikeMaker.Text = Obj_Bike[i].Maker;
                    txtRegistrationNumber.Text = Obj_Bike[i].RegistrationNumber;
                    txtRentPerDay.Text = Obj_Bike[i].RentPerDay.ToString();
                }
            }
        }

        private void FillBikeDetails()
        {
            Bike_BAL Obj_biker = new Bike_BAL();
            List<Bike> Obj_Bike_ID = Obj_biker.GetBikeData();

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
        protected void UpdateBike_btn_Click(object sender, EventArgs e)
        {
            Bike Obj_Ins_Bike = new Bike
            {
                BikeID = Convert.ToInt32(ddl_Bike.SelectedValue),
                Model = txtBikeModel.Text,
                Maker = txtBikeMaker.Text,
                RegistrationNumber = txtRegistrationNumber.Text,
                RentPerDay = Convert.ToDecimal(txtRentPerDay.Text)
            };
            Bike_BAL.UpdateBike(Obj_Ins_Bike);
            Response.Redirect("default.aspx");

        }
        protected void DeleteBike_btn_Click(object sender, EventArgs e)
        {
            Bike_BAL.DeleteBike(ddl_Bike.SelectedValue);
            Response.Redirect("default.aspx");
        }
    }
}