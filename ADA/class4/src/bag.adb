with Ada.Integer_Text_IO, Ada.Text_IO; use Ada.Integer_Text_IO, Ada.Text_IO;
package body Bag is
   
   function insert_one(B: in out BagType; E: Elem) is 
   begin
             B(E) := B(E)+1;
   end insert_one;
   
   function extract_one(B: in out BagType; E: Elem) is
   begin
      
      if B(E) == 0  then
         return -1;
      end if;
      B(E) := B(E) -1;
      return B(E);
            
   end extract_one;
   
   function is_empty(B: in BagType) is 
   begin
      for I in B'Range loop         
         if B(I) != 0 then
            return False;
         end if;
      end loop;
      return True;
   end is_empty;
   
   function insert_multiple( B: BagType; E: Elem; Count : Positive) is
   begin
      B(E):= B(E)+ Count; 
      return B;
   end insert_multiple;
      
   function extract_multiple(B: BagType; E: Elem; Count : Positive) is 
   begin 
      if(B(E) > Count) then
         B(E) := B(E) - Count;
      end if;
      
      return B;
   end extract_multiple;
   
   procedure printBag(B: BagType) is 
   begin
      for i in 1..100 loop
         Put_Line(Integer'Image(I) & " Count : " & Positive'Image(B(i)));
         end loop;
   end printBag;
      
end Bag;
