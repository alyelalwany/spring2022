with Ada.Integer_Text_IO, Ada.Float_Text_IO,Ada.Text_IO;
use Ada.Integer_Text_IO,Ada.Float_Text_IO;
with Math;
procedure euler is
   Sum : Float := 0.0;
   N : Positive;
   Term:Float:=0.0;
begin
   Get(N);
   for I in 1..N loop
      Term:= 1.0/ Float (Math.factorial(i));
      Sum:=Sum+Term;
   end loop;
   Put(Term);
   
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Pi estimated to N = 20000");
   Put(Math.calcPi);
end euler;
