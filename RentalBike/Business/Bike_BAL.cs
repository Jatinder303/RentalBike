using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RentalBike.Business
{
    public class Bike_BAL
    {
        BikeRentalEntities db = new BikeRentalEntities();
        public List<Bike> GetBikeData()
        {
            try
            {
                List<Bike> obj_Bike = null;
                obj_Bike = (from u in db.Bikes select u).ToList();
                return obj_Bike;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void InsertBike(Bike Obj_Bike_Insert)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    db.Bikes.Add(Obj_Bike_Insert);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public static List<Bike> GetBikeDetails(string selectedValue)
        {
            try
            {
                List<Bike> Obj_Bike_Detail = null;
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    Obj_Bike_Detail = (from u in db.Bikes where u.BikeID.ToString() == selectedValue select u).ToList();
                }
                return Obj_Bike_Detail;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int UpdateBike(Bike Obj_Bike_Update)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    //Lembda expression

                    Bike c = db.Bikes.SingleOrDefault(x => x.BikeID == Obj_Bike_Update.BikeID);
                    c.Model = Obj_Bike_Update.Model;
                    c.Maker = Obj_Bike_Update.Maker;
                    c.RegistrationNumber = Obj_Bike_Update.RegistrationNumber;
                    c.RentPerDay = Obj_Bike_Update.RentPerDay;
                    db.SaveChanges();
                    return Obj_Bike_Update.BikeID;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void DeleteBike(string Obj_Bike_Delete)
        {
            try
            {
                using (BikeRentalEntities db = new BikeRentalEntities())
                {
                    //Lembda expression
                    Bike c = db.Bikes.SingleOrDefault(x => x.BikeID.ToString().Trim() == Obj_Bike_Delete.Trim());
                    if (c != null)
                    {
                        db.Bikes.Remove(c);
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