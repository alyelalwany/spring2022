generic
   type Elem is private;
package Stacksgen is
   type Stack (Max : Positive) is limited private;

   procedure Push (V : in out Stack; E : in Elem);
   procedure Pop (V : in out Stack; E : out Elem);
   function Top (V : Stack) return Elem;
   function Is_Empty (V : Stack) return Boolean;
   function Is_Full (V : Stack) return Boolean;
   function Size (V : Stack) return Natural;
   generic
      with procedure Process_Element (Item : in Elem);
   procedure For_Each (S : in Stack);

private
   type TArray is array (Integer range <>) of Elem;
   type Stack (Max : Positive) is record
      Data    : TArray (1 .. Max);
      Pointer : Natural := 0;
   end record;
end Stacksgen;
