with Car_Package; use Car_Package;
package Registration_Package is
   subtype Length is Positive range 1..1000;
   
   type Registration(Max: Length := 100) is limited private;

   procedure addCar(R : in out Registration; C : in Car); -- Add the `car` (given Car parameter) to the Registration
   procedure printAllCars(R : Registration); -- Print all cars that are registered
   function daysRented(R : Registration; Name : String) return Natural; -- Return how many days a car with given `Name` parameter has been rented
   function timesRented(R : Registration; Name : String) return Natural; -- Return how many times a car with given `Name` parameter has been rented
   function Size(R : Registration) return Natural; -- Return the size of Registration
   function allTotalDays(R : Registration) return Natural; -- Return a total number of days where all cars have been rented
   function mostRentedCar(R : Registration) return String; -- Return name of the car which has been rented the most
   function mostRentedDay(R : Registration) return Natural; -- Return in which day most of the cars has been rented
   function notRentedCarDay(R : Registration) return Integer; -- Return in which day none of the cars has been rented, if there is no such day return -1

private
   type TArray is array (Positive range <> ) of Car;
   type Registration(Max: Length:=100) is record
      Cars: TArray(1..Max);
      size: Natural:=0;
   end record;
end Registration_Package;
