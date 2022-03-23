with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Car_Package is

   type Car is private;
   function Get_Name(C : Car) return String; -- Return Name of the Car which is String type
   function Get_First_Day(C : Car) return Integer; -- Return First rented day of the car which is Integer type
   function Get_Last_Day(C : Car) return Integer; -- Return Lasy rented day of the car which is Integer type
   procedure Set_Name(C : in out Car; dn : in String); -- Set `dn` (given String parameter) as a name of the rented car
   procedure Set_First_day(C : in out Car; df : in Integer); -- Set `df` (given Integer parameter) as a first day of the rented car
   procedure Set_Last_day(C : in out Car; dl : in Integer); -- Set `dl` (given Integer parameter) as a first day of the rented car
   procedure Print_Car(C : Car); -- Print given Car parameter's name as well as its first and last day of the rent

private
   type Car is record
      Name:  String(1..5);
      FirstDay: Integer;
      LastDay: Integer;  
   end record;
   
   
end Car_Package;
