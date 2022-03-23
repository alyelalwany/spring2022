package exercises is

   -- Lab3
   type Index is new Integer;
   type Elem is new Integer;
   type TArray is array (Index range <>) of Elem;
   type Matrix is array (Index range <>, Index range <>) of Elem;
   
   function recSum (T : TArray; N : Index) return Elem;
   function addRec (T:TArray) return Elem;
   function bubbleSort (T : in out TArray) return TArray;
   procedure Swap (A, B : in out Elem);
   function sumDiagonal (M : in Matrix) return Elem;
   procedure LocalMaximum(M:Matrix);
   procedure spiralPrint (M: in Matrix);
   
end exercises;
