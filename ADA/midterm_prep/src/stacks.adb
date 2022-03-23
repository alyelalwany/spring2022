with Ada.Text_IO; use  Ada.Text_IO;
package body Stacks is
   
   procedure Push(V: in out Stack; E: in Elem) is
   begin
      if is_Full(V) then 
         Put_Line("Cannot push, stack full");
         return ;
      else
         v.Pointer := v.Pointer + 1;
         v.Data(V.Pointer) := E;
      end if;
   end;
   
   procedure Pop(V: in out Stack; E: out Elem) is
   begin
      if is_Empty(V) then 
         Put_Line("Cannot pop, stack empty");
         return;
      else
         E := Top(V);
         v.Pointer := v.Pointer - 1;
      end if;
   end;
   function Top(V: Stack) return Elem is
   begin
      return  V.Data(v.Pointer);
   end ;
   
   function is_Empty(V :Stack) return Boolean is 
   begin
      return V.Pointer = 0;
   end;
   function is_Full(V :Stack) return Boolean is 
   begin
      return V.Pointer >= V.Max;
   end;
   function size(V :Stack) return Natural is 
   begin
      return V.Pointer;
   end;

end Stacks;
