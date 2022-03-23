generic
   type Elem is private;

package Bag is
   type BagType (Max : Positive) is limited private;

   function getMultiplicity (B : BagType; E : Elem) return Natural;
   procedure add (B : in out BagType; E : Elem);
   function hasElement (B : in out BagType; E : Elem) return Boolean;
   procedure remove (B : in out BagType; E : Elem);
   procedure print (B : in out BagType);
   function isEmpty (B : in out BagType) return Boolean;

   generic
      with procedure process_elem (E : in out Elem);
   procedure For_Each (B : in out BagType);

private
   type Item is record
      Element      : Elem;
      Multiplicity : Natural := 0;
   end record;
   type TArray is array (Integer range <>) of Item;
   type BagType (Max : Positive) is record
      T       : TArray (1 .. Max);
      Pointer : Natural := 0;
   end record;
end Bag;
