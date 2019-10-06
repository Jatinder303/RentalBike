using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RentalBike.Business
{
    public class Login_BAL
    {
        BikeRentalEntities db = new BikeRentalEntities();
        public List<Login> GetLoginData_BAL(string username, string password)
        {
            try
            {
                List<Login> Obj_login = null;
                Obj_login = (from u in db.Logins where u.UserName == username && u.Password == password select u).ToList();
                return Obj_login;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}