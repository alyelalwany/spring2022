with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
package body BagRecord is

   procedure insertOne (B: in out TBag; E: in Elem) is 
   begin
      B.Arr(E) := B.Arr(E) +1;
      B.size := B.size +1;
   end ;
     procedure insertMultiple (B: in out TBag; E: in Elem; Count: in Positive) is 
   begin
      B.Arr(E) := B.Arr(E) + Count;
      B.size := B.size + Count;
   end ;
   
  procedure extractOne (B: in out TBag; E: in Elem) is 
   begin
      if B.Arr(E) /= 0 then 
         B.Arr(E) := B.Arr(E) -1;
         B.size := B.size -1;
      end if;
   end ;
  procedure extractMultiple (B: in out TBag; E: in Elem;Count: in Positive) is 
   begin
      if B.Arr(E) > Count then 
         B.Arr(E) := B.Arr(E) -Count;
         B.size := B.size - Count;
      else
         Put_Line ("Only removed as many as I have from this item");
         B.Arr(E) := 0;
         B.size := B.size - B.Arr(E);
      end if;
   end ;
   function isEmpty(B:TBag) return Boolean is 
   begin
      return B.size = 0;
   end;
   procedure print(B :TBag) is 
   begin
      for I in 1..100 loop
         Ada.Integer_Text_IO.Put(I);
         Ada.Text_IO.Put(" : ");
         Ada.Integer_Text_IO.Put(B.Arr(I));
         Ada.Text_IO.New_Line;
      end loop;
   end;
   function  Size(B :TBag) return Natural is
   begin
      return B.size;
   end ;
end BagRecord;
