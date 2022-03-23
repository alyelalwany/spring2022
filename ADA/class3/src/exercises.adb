with Ada.Text_IO; use Ada.Text_IO;
package body exercises is

   -- Lab3

   function recSum (T : TArray; N : Index) return Elem is
   begin
      if N < 1 then
         return 0;
      end if;
      return (recSum (T, N - 1) + T (N));
   end recSum;

   --  Optimized
   function addRec (T : TArray) return Elem is
   begin
      if T'Length > 1 then
         return T (T'First) + addRec (T (Index'Succ (T'First) .. T'Last));
      else
         return T (T'First);
      end if;
   end addRec;

   procedure Swap (A, B : in out Elem) is
   begin
      A := A + B;
      B := A - B;
      A := A - B;
   end Swap;

   function bubbleSort (T : in out TArray) return TArray is
      flag : Boolean := True;
   begin
      while flag loop
         flag := False;
         for I in T'Range loop
            if I /= T'Last then
               if T (I) > T (I + 1) then
                  Swap (T (I), T (I + 1));
                  flag := True;
               end if;
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

   procedure LocalMaximum (M : Matrix) is
      minimums           : TArray (M'Range (2));
      minValue, maxValue : Elem;
   begin
      for j in M'Range (2) loop
         minValue := Elem'Last;
         for i in M'Range (1) loop
            if minValue > M (i, j) then
               minValue := M (i, j);
            end if;
         end loop;
         minimums (j - M'First (2) + minimums'First) := minValue;
      end loop;

      for i in M'Range (1) loop
         maxValue := Elem'First;
         for j in M'Range (2) loop
            if maxValue < M (i, j) then
               maxValue := M (i, j);
            end if;
         end loop;

         for j in M'Range (2) loop
            if maxValue = M (i, j)
              and then maxValue = minimums (j - M'First (2) + minimums'First)
            then
               Put_Line
                 ("M(" & Index'Image (i - M'First (1) + 1) &
                  Index'Image (j - M'First (2) + 1) & " ) =" &
                  Elem'Image (maxValue));
            end if;
         end loop;
      end loop;
   end LocalMaximum;

   procedure spiralPrint (M : in Matrix) is
      
   begin
      if ( i>= m) or (j >=n) then
         return ;
      end if;
      
      for p in i..(n-1) loop
         Put
      for I in M'Range (1) loop
         
         Put (Integer'Image (1));
      end loop;

   end spiralPrint;

end exercises;
