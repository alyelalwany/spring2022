with Ada.Text_IO; use Ada.Text_IO;
package body car_package is

   function Get_Name (C : Car) return String is
   begin
      return C.Name;
   end Get_Name;
   function Get_First_Day (C : Car) return Integer is
   begin
      return C.FirstDay;
   end Get_First_Day;
   function Get_Last_Day (C : Car) return Integer is
   begin
      return C.LastDay;
   end Get_Last_Day;
   procedure Set_Name (C : in out Car; dn : in String) is
   begin
      C.Name := dn;
   end Set_Name;
   procedure Set_First_day (C : in out Car; df : in Integer) is
   begin
      C.FirstDay := df;
   end Set_First_day;
   procedure Set_Last_day (C : in out Car; dl : in Integer) is
   begin
      C.LastDay := dl;

   end Set_Last_day;
   procedure Print_Car (C : Car) is
   begin
      Put_Line
        (" Name: " & C.Name & " first day: " & Integer'Image (C.FirstDay) &
         " last day: " & Integer'Image (C.LastDay));
   end Print_Car;


end car_package;
