generic
   type Elem is private;
package Stacks is 
   type Stack (Max : Positive) is limited private;
   
   procedure Push(V: in out Stack; E: in Elem);
   procedure Pop(V: in out Stack; E: out Elem);
   function Top(V: Stack) return Elem; 
   function is_Empty(V :Stack) return Boolean;
   function is_Full(V :Stack) return Boolean;
   function size(V :Stack) return Natural;
   
private 
   type TArray is array (Integer range <>) of Elem;
   type Stack (Max: Positive) is record
      Data: TArray(1..Max);
      Pointer : Natural :=0;
   end record;
end Stacks;
