with Ada.Text_IO;
use Ada.Text_IO;

procedure sort is
   type Index is new Integer;
   type Elem is new Integer;
   type TArray is array (Index range <>) of Elem;
   
   function max_pos(T: TArray) return Index is
      max_index : Index := T'First;
   begin 
      for i in T'Range loop
         if T(max_index) < T(i) then
            max_index := i;
         end if;
      end loop;
      return max_index;
   end max_pos;
   
   procedure Swap ( A, B : in out Elem) is 
      Tmp: Elem := A;
   begin
      A := B;
      B := Tmp;
   end Swap;
   
   procedure Order( T: in out TArray) is
      max_index: Index;
   begin
      for i in reverse T'Range loop
         max_index := max_pos(T(T'First..i));
         Put_Line(Elem'Image(T(i)));
         Swap(T(i), T(max_index));
      end loop;
   end Order;
   
   T: TArray := (3,6,1,5,3);
   
begin
   Order(T);
   for i in T'Range loop
      Put_Line(Elem'Image(T(i)));
   end loop;
end sort;
