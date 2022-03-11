with Ada.Integer_Text_IO;
procedure factorial is
   N:Integer;
   F:Integer:=1;
begin
   Ada.Integer_Text_IO.Get(N);
   for I in reverse 1..N loop
      F:=F*I;
   end loop;
   Ada.Integer_Text_IO.Put(F);   
end factorial;
