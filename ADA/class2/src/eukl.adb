with Ada.Integer_Text_IO;
procedure eukl is
   A,B : Natural;
   Tmp: Natural;
begin
   Ada.Integer_Text_IO.Get(A);
   Ada.Integer_Text_IO.Get(B);
   while B/=0 loop
      Tmp:=A mod B;
      A := B;
      B := Tmp;
   end loop;
   Ada.Integer_Text_IO.Put(A);
end eukl;
