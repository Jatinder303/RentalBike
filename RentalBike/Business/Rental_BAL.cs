using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RentalBike.Business
{
    public class Rental_BAL
    {
        BikeRentalEntities db = new BikeRentalEntities();
        public List<Rent> GetRentalData()
        {
            try
            {
                List<Rent> obj_Rent = null;
                obj_Rent = (from u in db.Rents select u).ToList();
                return obj_Rent;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Returned> GetReturnedData()
        {
            try
            {
                List<Returned> obj_Returned = null;
                obj_Returned = (from u in db.Returneds select u).ToList();
                return obj_Returned;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void InsertRent(Rent Obj_Rent_Insert)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    db.Rents.Add(Obj_Rent_Insert);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Rent> GetRentDetails(string selectedValue)
        {
            try
            {
                List<Rent> Obj_Rent_Detail = null;
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    Obj_Rent_Detail = (from u in db.Rents where u.RentID.ToString() == selectedValue select u).ToList();
                }
                return Obj_Rent_Detail;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void DeleteIssue(string Obj_Issue_Delete)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    //Lembda expression
                    Rent c = db.Rents.SingleOrDefault(x => x.RentID.ToString().Trim() == Obj_Issue_Delete.Trim());
                    if (c != null)
                    {
                        db.Rents.Remove(c);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public static void InsertReturnedBike(Returned Obj_Returned_Bike_Insert)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    db.Returneds.Add(Obj_Returned_Bike_Insert);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}