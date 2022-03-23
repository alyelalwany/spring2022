with Search, Ada.Text_IO;
use Ada.Text_IO;
procedure Search_Demo is

   type TInt is array (Integer range <>) of Integer;
   function isNegative (a : Integer) return Boolean is
   begin
      return (a < 0);
   end isNegative;
   procedure mySearch is new Search (Integer, Integer, TInt, isNegative);

   a     : TInt (1 .. 5) := (1, 2, -3, 4, -5);
   flag  : Boolean;
   index : Integer;

begin
   mySearch (T => a, b => flag, j => index);
   if flag then
      Put_Line
        ("The first negative element is : " & Integer'Image (a (index)));
   else
      Put_Line ("No negatives found");
   end if;
end Search_Demo;
