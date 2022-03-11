with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;


procedure class2solutions is

   function sumDigits( numAsString: in String) return Integer is 
      
      sum : Integer := 0;
   begin
      
      for i in numAsString'Range loop
         Put_Line(Integer'Image(i));
         sum := sum + Integer'Value((1=>numAsString(i)));
      end loop;
      return sum;
   end sumDigits;
   
   
   function divisableBy9( inputString: in String) return Boolean is
      flag : Boolean := False;
      sum : Integer := sumDigits(inputString);
   begin
      if sum mod 9 = 0 then
         flag := True;
      end if;
      return flag;
   end divisableBy9;
   

   function perfectNumber(input : in Integer) return Boolean is
      --  6 = 1+2+3.
      flag : Boolean := False;
      sum: Integer := 0;
   begin 
      
      for i in reverse 1..input loop
         if input mod i = 0 then
               sum := sum + i;
              end if ;
      end loop;
      if sum = input then
         flag := True;
      end if;
      return flag;
   end perfectNumber;
   
   testString: String := "123";
   stringDivisableBy9: String := "8190";
   begin

   --  Put_Line(Integer'Image(sumDigits("12341")));
   --  Put_Line(Boolean'Image(divisableBy9(stringDivisableBy9)));

   for i in 1..100 loop
      if perfectNumber(i) then
        Put_Line(Integer'Image(i));
      end if;
   end loop;
   
      
end class2solutions;
