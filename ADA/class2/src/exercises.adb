with Ada.Text_IO; use Ada.Text_IO;
package body exercises is

   -- Lab2

   function sumDigits (numAsString : in String) return Integer is
      sum : Integer := 0;
   begin

      for i in numAsString'Range loop
         sum := sum + Integer'Value ((1 => numAsString (i)));
      end loop;
      return sum;
   end sumDigits;

   function divisableBy9 (inputString : in String) return Boolean is
      flag : Boolean := False;
      sum  : Integer := sumDigits (inputString);
   begin
      if sum mod 9 = 0 then
         flag := True;
      end if;
      return flag;
   end divisableBy9;

   function perfectNumber (input : in Integer) return Boolean is
      --  6 = 1+2+3.
      flag : Boolean := False;
      sum  : Integer := 0;
   begin
      for i in reverse 1 .. input - 1 loop
         if input mod i = 0 then
            sum := sum + i;
         end if;
      end loop;
      if sum = input then
         flag := True;
      end if;
      return flag;
   end perfectNumber;

   function isPalindrome (input : in String) return Boolean is
      N : Integer := input'Last;
      I : Integer := input'First;
   begin
      while I /= N loop
         if input (I) /= input (N) then
            return False;
         end if;
         N := N - 1;
         I := I + 1;
      end loop;
      return True;

   end isPalindrome;

   function nthPower (x : in Positive; n : in Positive) return Positive is
   begin
      if n = 1 then
         return x;
      end if;
      return x * nthPower (x, n - 1);
   end nthPower;

   function recFactorial (x : in Positive) return Positive is
   begin
      if x = 1 then
         return 1;
      end if;
      return x * recFactorial (x - 1);
   end recFactorial;

   -- Lab3

   function recSum (T : Int_Array; N : Index) return Elem is
   begin
      if N < 1 then
         return 0;
      end if;
      return (recSum (T, N - 1) + T (N));
   end recSum;

   procedure Swap (A, B : in out Elem) is
      Tmp : Elem := A;
   begin
      A := B;
      B := Tmp;
   end Swap;

   function bubbleSort (T : in out Int_Array) return Int_Array is
   begin
      for I in T'First .. T'Last loop
         for J in T'First .. T'Last - I loop
            if T (J) >= T (J + 1) then
               Swap (T (J), T (J + 1));
            end if;

         end loop;
      end loop;
      return T;

   end bubbleSort;

   function sumDiagonal (M : in Matrix) return Elem is
      S : Elem := 0;
   begin
      for I in M'Range (1) loop
         S := S + M (I, I);
      end loop;
      return S;
   end sumDiagonal;

   procedure spiralPrint (M: in Matrix) is

   begin
      for I in M'Range(1) loop
         Put(Integer'Image(1));
      end loop;

   end spiralPrint;
end exercises;
