using RentalBike.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentalBike
{
    public partial class Login1 : System.Web.UI.Page
    {
           protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    if (Session["UserID"] != null)
                    {
                        Response.Redirect("Default.aspx?msg=Successfully Logged in.");
                    }
                }
                if (Request.QueryString["msg"] != null)
                {
                    ltrmessage.Text = Request.QueryString["msg"];
                }
            }

            protected void btn_Click(object sender, EventArgs e)
            {
                if (tbxUsername.Text != "" && tbxPassword.Text != "")
                {

                Business.Login_BAL Obj_Login = new Business.Login_BAL();

                List<Login> dt = Obj_Login.GetLoginData_BAL(IsSQLInjection(tbxUsername.Text), IsSQLInjection(tbxPassword.Text));
                    if (dt != null && dt.Count > 0)
                    {
                        Session["UserID"] = dt[0].Id.ToString();
                        Response.Redirect("Default.aspx?msg=Successfully Logged in.", true);
                    }
                    else
                    {
                        ltrmessage.Text = "<font color='red'>Username or Password may be incorrect!</font>";
                    }
                }
            }

            private string IsSQLInjection(string text)
            {
                return text.Replace("'", "").Replace("(", "").Replace(")", "").Replace("\"", "").Replace("*", "").Replace("$", "").Replace("&", "").Replace("-", "").Replace(";", "").Replace("[", "").Replace("]", "").Replace("}", "").Replace("{", "").Replace("<", "").Replace(">", "").Replace("=", "");
            }
        }
    }