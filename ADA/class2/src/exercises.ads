package exercises is

   type Index is new Integer;
   type Elem is new Integer;
   type Int_Array is array (Index range <>) of Elem;
   type Matrix is array (Index range <>, Index range <>) of Elem;
   -- Lab2
   function sumDigits (numAsString : in String) return Integer;
   function divisableBy9 (inputString : in String) return Boolean;
   function perfectNumber (input : in Integer) return Boolean;
   function isPalindrome (input : in String) return Boolean;
   function nthPower (x : in Positive; n : in Positive) return Positive;
   function recFactorial (x : in Positive) return Positive;
   -- Lab3
   function recSum (T : Int_Array; N : Index) return Elem;
   function bubbleSort (T : in out Int_Array) return Int_Array;
   procedure Swap (A, B : in out Elem);
   function sumDiagonal (M : in Matrix) return Elem;
   procedure spiralPrint (M: in Matrix);

end exercises;
