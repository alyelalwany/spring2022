procedure Swap (A, B : in out T) is
   Temp : T := A;
begin
   A := B;
   B := Temp;
end Swap;
