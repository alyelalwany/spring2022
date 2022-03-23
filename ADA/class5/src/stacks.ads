generic 
   type Elem is private;
   
package Stacks is 
   
   type Stack (Max: Positive) is limited private;
   
   procedure push(V: in out Stack; E : in Elem);
   procedure pop(V: in out Stack; E : out Elem);
   function top(V: Stack) return Elem;
   function isEmpty(V: Stack) return Boolean;
   function isFull(V: Stack) return Boolean;
   function size(V:Stack) return Natural;
   
private
   type TArray is array (Integer range <>) of Elem;
   type Stack(Max: Positive) is record
      Data: TArray(1..Max);
      Pointer: Natural:=0;
   end record;
   
end Stacks;
