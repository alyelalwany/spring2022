with Ada.Integer_Text_IO;
procedure gcd is
   A,B :Positive;
begin
   Ada.Integer_Text_IO.Get(A);
   Ada.Integer_Text_IO.Get(B);
   while A/=B loop
      if A > B then
         A:= A - B;
      else
         B:= B - A;
      end if;
   end loop;
   Ada.Integer_Text_IO.Put(A);
end gcd;

function gcd ( A, B : Positive ) return Positive is
   X: Positive := A;
   Y: Natural := B;
   Tmp: Natural;
begin
   while Y /= 0 loop
      Tmp := X mod Y;
      X := Y;
      Y := Tmp;
   end loop;
   return X;
end gcd;
