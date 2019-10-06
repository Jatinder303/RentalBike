using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RentalBike.Business
{
    public class Customer_BAL
    {
        BikeRentalEntities db = new BikeRentalEntities();
        public  List<Customer> GetCustomerData()
        {
            try
            {
                List<Customer> obj_Cust = null;
                obj_Cust = (from u in db.Customers  select u).ToList();
                return obj_Cust;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void InsertCustomer(Customer Obj_Customer_Insert)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    db.Customers.Add(Obj_Customer_Insert);
                    db.SaveChanges();
                }
               
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public static List<Customer> GetCustomerDetails(string selectedValue)
        {
            try
            {
                List<Customer> Obj_Cust_Detail = null;
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    Obj_Cust_Detail = (from u in db.Customers where u.CustomerID.ToString() == selectedValue select u).ToList();
                }
                return Obj_Cust_Detail;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int UpdateCustomer(Customer Obj_Cust_Update)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    //Lembda expression

                    Customer c = db.Customers.SingleOrDefault(x => x.CustomerID == Obj_Cust_Update.CustomerID);
                    c.FirstName = Obj_Cust_Update.FirstName;
                    c.LastName = Obj_Cust_Update.LastName;
                    c.Address = Obj_Cust_Update.Address;
                    c.Phone = Obj_Cust_Update.Phone;
                    c.LicenseNo = Obj_Cust_Update.LicenseNo;
                    db.SaveChanges();
                    return Obj_Cust_Update.CustomerID;
                }
            }
            catch (Exception ex)
            {
               throw ex;
            }
        }

        public static void DeletCustomer(string Obj_Cust_Delete)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    //Lembda expression
                    Customer c = db.Customers.SingleOrDefault(x => x.CustomerID.ToString().Trim() == Obj_Cust_Delete.Trim());
                    if (c != null)
                    {
                        db.Customers.Remove(c);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
