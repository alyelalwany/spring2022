package body stacks is

   procedure push(V: in out Stack; E : in Elem) is 
   begin
      V.Pointer := V.Pointer+ 1;
      V.Data(V.Pointer) := E;
   end;
   
   procedure pop(V : in out Stack; E: out Elem) is 
   begin
      if not isEmpty(V) then
         E:= top(V);
         V.Pointer := V.Pointer - 1 ;
      end if;
   end ;
   function top(V: in Stack) return Elem is
   begin
         return V.Data(V.Pointer);
   end ;
   
   function isEmpty(V:in Stack) return Boolean is
   begin
      return V.Pointer = 0;
   end ;
   function isFull(V:in Stack) return Boolean is
   begin
      return V.Pointer >= V.Max;
   end ;
   function size(V:in Stack) return Natural is
   begin
      return V.Pointer;
   end ;
   
end stacks;
