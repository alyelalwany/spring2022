with Registration_Package, Ada.Text_IO, Car_Package;
use Registration_Package, Ada.Text_IO, Car_Package;
procedure Main is
   R  : Registration;
   C1 : Car;
   C2 : Car;
   C3 : Car;
   --  C4 : Car;
   --  C5 : Car;
   --  C6 : Car;
begin

   -- Set functions for car

   Set_First_day (C1, 1);
   Set_First_day (C2, 2);
   Set_First_day (C3, 15);
   --  Set_First_day (C4, 4);
   --  Set_First_day (C5, 5);
   --  Set_First_day (C6, 4);

   Set_Last_day (C1, 13);
   Set_Last_day (C2, 3);
   Set_Last_day (C3, 30);
   --  Set_Last_day (C4, 20);
   --  Set_Last_day (C5, 30);
   --  Set_Last_day (C6, 30);

   Set_Name (C1, "BMW-1");
   Set_Name (C2, "BMW-2");
   Set_Name (C3, "AMG-1");
   --  Set_Name (C4, "AMG-2");
   --  Set_Name (C5, "AMG-3");
   --  Set_Name (C6, "AMG-4");

   --Testing for car
   Put_Line
     ("car : " & Get_Name (C1) & "=> First Day : " &
      Integer'Image (Get_First_Day (C1)) & ",  Last day : " &
      Integer'Image (Get_Last_Day (C1)));
   Put_Line
     ("car : " & Get_Name (C2) & "=> First Day : " &
      Integer'Image (Get_First_Day (C2)) & ",  Last day : " &
      Integer'Image (Get_Last_Day (C2)));
   Put_Line
     ("car : " & Get_Name (C3) & "=> First Day : " &
      Integer'Image (Get_First_Day (C3)) & ",  Last day : " &
      Integer'Image (Get_Last_Day (C3)));
   --  Put_Line
   --    ("car : " & Get_Name (C4) & "=> First Day : " &
   --     Integer'Image (Get_First_Day (C4)) & ",  Last day : " &
   --     Integer'Image (Get_Last_Day (C4)));
   --  Put_Line
   --    ("car : " & Get_Name (C5) & "=> First Day : " &
   --     Integer'Image (Get_First_Day (C5)) & ",  Last day : " &
   --     Integer'Image (Get_Last_Day (C5)));
   --  Put_Line
   --    ("car : " & Get_Name (C6) & "=> First Day : " &
   --     Integer'Image (Get_First_Day (C6)) & ",  Last day : " &
   --     Integer'Image (Get_Last_Day (C6)));

   Print_Car (C1);
   Print_Car (C2);
   Print_Car (C3);
   --  Print_Car (C4);
   --  Print_Car (C5);
   --  Print_Car (C6);

   --Adding for Registration
   addCar (R, C1);
   addCar (R, C2);
   addCar (R, C3);
   --  addCar (R, C4);
   --  addCar (R, C5);
   --  addCar (R, C6);

   -- Testing
   Put_Line
     ("Car BMW-1 was rented for " & Integer'Image (daysRented (R, "BMW-1")) &
      " days " & Natural'Image (timesRented (R, "BMW-1")) & " times");
   Put_Line
     ("Car BMW-1 was rented for " & Integer'Image (daysRented (R, "BMW-2")) &
      " days " & Natural'Image (timesRented (R, "BMW-2")) & " times");
   Put_Line
     ("Car AMG-1 was rented for " & Integer'Image (daysRented (R, "AMG-1")) &
      " days " & Natural'Image (timesRented (R, "AMG-1")) & " times");
   --  Put_Line
--    ("Car AMG-2 was rented for " & Integer'Image (daysRented (R, "AMG-2")) &
   --     " days " & Natural'Image (timesRented (R, "AMG-2")) & " times");
   --  Put_Line
--    ("Car AMG-3 was rented for " & Integer'Image (daysRented (R, "AMG-3")) &
   --     " days " & Natural'Image (timesRented (R, "AMG-3")) & " times");
   --  Put_Line
--    ("Car AMG-4 was rented for " & Integer'Image (daysRented (R, "AMG-4")) &
   --     " days " & Natural'Image (timesRented (R, "AMG-4")) & " times");

   Put_Line
     ("The most rented car is " & mostRentedCar (R => R) & " with " &
      Integer'Image (timesRented (R, mostRentedCar (R => R))) & " times " &
      " total " & Integer'Image (daysRented (R, mostRentedCar (R => R))));

   Put_Line
     ("Total of rented days combined " & Natural'Image (allTotalDays (R)));
   Put_Line ("Most rented day : " & Natural'Image (mostRentedDay (R)));
   Put_Line ("Not rented day : " & Integer'Image (notRentedCarDay (R)));
   Put_Line ("# of Cars rented : " & Integer'Image (Size (R)));
   printAllCars (R);

end Main;
