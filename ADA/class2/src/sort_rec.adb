with Ada.Text_IO;
use Ada.Text_IO;
procedure sort_rec is
   type Index is new Integer;
   type Elem is new Integer;
   type TArray is array (Index range <>) of Elem;
   
   function max_pos(T:TArray) return Index is
      max_index: Index := T'First;
   begin
      for i in T'Range loop
         if T(i) < T(max_index) then
            max_index := i;
         end if;
      end loop;
      return max_index;
   end max_pos;
   procedure Swap(A,B : in out Elem) is 
      tmp : Elem := A;
   begin
      A := B;
      B := tmp;
   end Swap;
   
   procedure Order( T: in out TArray) is
      max_index : Index;
   begin
      if T'Length > 1 then
         max_index := max_pos(T);
         Swap(T(T'Last),T(max_index));
         Order(T(T'First..Index'Pred(T'Last)));
      end if;
   end Order;
   T: TArray := (3,6,1,5,3);
begin
   Order(T);
   for i in T'Range loop
      Put_Line(Elem'Image(T(i)));
   end loop;
end sort_rec;
