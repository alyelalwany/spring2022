with Ada.Text_IO;
use Ada.Text_IO;

procedure sort_function is
   type Index is new Integer;
   type Elem is new Integer;
   type TArray is array (Index range <>) of Elem;
   
   function max_pos (T:TArray) return Index is 
      max_index : Index:= T'First;
   begin
      for i in T'Range loop
         if T(max_index) < T(i) then
            max_index := i;
         end if;
      end loop;
      return max_index;
    end max_pos;
   procedure Swap (A, B : in out Elem) is
      tmp: Elem := A;
   begin
      A := B;
      B := tmp;
   end Swap;
   
   procedure Order(T: in out TArray) is 
      max_index : Index;
   begin
      for i in reverse T'Range loop
         max_index := max_pos(T(T'First..i));
         Swap(T(i),T(max_index));
      end loop;
   end Order;
   
   function Sorting(T: TArray) return TArray is 
      b : TArray := T;
   begin
      Order(b);
      return b;
   end Sorting;
   
   T: TArray := (3,6,1,5,3,-12);
begin
   T:= Sorting(T);
   for i in T'Range loop
      Put_Line(Elem'Image(T(i)));
   end loop;        
end sort_function;
