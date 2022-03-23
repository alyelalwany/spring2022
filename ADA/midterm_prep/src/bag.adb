with Ada.Text_IO; use Ada.Text_IO;
package body Bag is

   function getMultiplicity (B : BagType; E : Elem) return Natural is
   begin
      for I in B.T'First .. B.T'Last loop
         if B.T (I).Element = E then
            return B.T (I).Multiplicity;
         end if;
      end loop;
      return 0;
   end getMultiplicity;

   procedure add (B : in out BagType; E : Elem) is
      Flag : Boolean := False;
   begin
      for I in B.T'First .. B.T'Last loop
         if B.T (I).Element = E then
            Flag                 := True;
            B.T (I).Multiplicity := B.T (I).Multiplicity + 1;
         end if;
      end loop;
      if isEmpty (B) or not Flag then
         B.Pointer                    := B.Pointer + 1;
         B.T (B.Pointer).Element      := E;
         B.T (B.Pointer).Multiplicity := 1;
      end if;
   end add;
   function hasElement (B : in out BagType; E : Elem) return Boolean is
   begin
      for I in B.T'First .. B.T'Last loop
         if B.T (I).Element = E then
            return True;
         end if;
      end loop;
      return False;
   end hasElement;
   procedure remove (B : in out BagType; E : Elem) is
   begin
      if isEmpty (B) then
         return;
      end if;
      for I in B.T'First .. B.T'Last loop
         if B.T (I).Element = E then
            if B.T (I).Multiplicity > 0 then
               B.T (I).Multiplicity := B.T (I).Multiplicity - 1;
            end if;
         end if;
      end loop;
   end remove;

   function isEmpty (B : in out BagType) return Boolean is
   begin
      return B.Pointer = 0;
   end isEmpty;
   procedure print (B : in out BagType) is
   begin
      for I in B.T'First .. B.T'Last loop
         Put_Line
           (Elem'Image (B.T (I).Element) & ":" &
            Natural'Image (B.T (I).Multiplicity));
      end loop;
   end print;

   procedure For_Each (B : in out BagType) is
   begin
      for I in B.T'First .. B.T'Last loop
         process_elem (B.T (I).Element);
      end loop;
   end For_Each;
end Bag;
