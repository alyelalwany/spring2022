with Ada.Integer_Text_IO;
procedure nchoosek is
   N,K:Positive;
   C:Positive:=1;
begin
   Ada.Integer_Text_IO.Get(N);
   Ada.Integer_Text_IO.Get(K);
   for I in 1..K loop
      C:=C * (N-(K-I))/I;
   end loop;
   Ada.Integer_Text_IO.Put(C);
end nchoosek;
