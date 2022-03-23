procedure Swap(A,B: in out T) is 
   Tmp: T:= A;
begin
   Tmp:= A;   
   A:= B;
   B:= Tmp;
end Swap;
