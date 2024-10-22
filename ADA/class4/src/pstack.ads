package PStack is

   subtype Elem is Integer;

   type Stack (Max : Positive) is limited private;
   procedure Push(V: in out Stack; E: in Elem);
   procedure Pop(V: in out Stack; E: out Elem);
   function Top(V:Stack) return Elem;
   function Is_Empty(V:Stack) return Boolean;
   function Size(V:Stack) return Natural;
   
private

   type TArray is array (Integer range <>) of Elem;
   type Stack (Max : Positive) is record
      Data    : TArray (1 .. Max);
      Pointer : Natural := 0;
   end record;

end PStack;
