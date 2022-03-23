with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
package body Bag is

   procedure insertOne (B : in out BagType; E : in Elem) is
   begin
      B (E) := B (E) + 1;
   end insertOne;
   
   procedure insertMultiple
     (B : in out BagType; E : in Elem; Count : in Positive)
   is
   begin
      B (E) := B (E) + Count;
   end insertMultiple;

   function isEmpty (B : in BagType) return Boolean is
   begin
      for I in B'Range loop
         if B (I) /= 0 then
            return False;
         end if;
      end loop;
      return True;
   end isEmpty;

   procedure extractMultiple
     (B : in out BagType; E : in Elem; Count : in Positive)
   is
   begin
      if (B (E) > Count) then
         B (E) := B (E) - Count;
      else
         Put_Line ("Only removed as many as I have from this item");
         B (E) := 0;
      end if;

   end extractMultiple;

   procedure extractOne (B : in out BagType; E : in Elem) is
   begin

      if B (E) /= 0 then
         B (E) := B (E) - 1;
      end if;
   end extractOne;

   procedure print (B : BagType) is
   begin
      for i in 1 .. 100 loop
         Put_Line (Integer'Image (i) & " : " & Positive'Image (B (i)));
      end loop;
   end print;

end Bag;
