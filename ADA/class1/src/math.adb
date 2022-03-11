package body math is

   function gcd(A,B:Positive) return Positive is
      X:Positive:=A;
      Y:Positive:=B;
   begin
      while X/= Y loop
         if X>Y then
            X:= X-Y;
         else
            Y:=Y-X;
         end if;
      end loop;
      return X;
   end gcd;
   
   function factorial(N:Natural) return Positive is
      Fakt: Positive :=1 ;
   begin
      for I in 1..N loop
         Fakt	:= Fakt *I;
      end loop;
      return Fakt;
   end factorial;
   
   function calcPi return Float is 
      Prod: Float :=1.0;
      K: Float:=0.0;
   begin
      for I in 1..20000 loop
         K:= K+2.0;
         Prod:= Prod * (K/(K-1.0)) * (K/(K+1.0));
      end loop;
      return Prod;
   end calcPi;
   
   
end math;
