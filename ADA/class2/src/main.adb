with Ada.Text_IO; use Ada.Text_IO;
with exercises; use exercises;
procedure Main is

   type My_Array is array (1 .. 5) of Integer;
   type Days is
     (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
   type Workload_Type is array (Days range <>) of Natural;

   type Month_Type is
     (January, February, March, April, May, June, July, August, September,
      October, November, December);

   type Date is record
      Day : Integer range 1 .. 31;
      Month : Month_Type := January;
      Year : Integer range 1 .. 3_000 := 2_012;
   end record;

   Ada_Birthday : Date := (10, December, 1_815);
   Leap_Day_2020 : Date := (Day => 29, Month => February, Year => 2_020);
   A : My_Array := (1, 2, 3, 4, 5);
   T_array : Int_Array (1 .. 7) := (5, 4, 3, 2, 8, 2, 1);
   num_String : String := "99";
   Workload : constant Workload_Type (Monday .. Friday) :=
     (Friday => 7, others => 8);
   S : Integer := 0;
   sum : Integer := 0;

   M : Matrix := ((1, 2, 3), (1, 2, 2), (3, 2, 1));
   I : Matrix := ((1, 0), (0, 1));
   test_matrix : Matrix :=
     ((11, 22, 33, 44, 55),
      (1, 8, 3, 8, 8),
      (10, 10, 20, 30, 1));

begin

   spiralPrint (test_matrix);

end Main;
