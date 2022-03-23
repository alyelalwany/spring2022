with Ada.Text_IO; use Ada.Text_IO;
package body stacksgen is

   procedure Push (V : in out Stack; E : in Elem) is
   begin
      if Is_Full (V) then
         Put_Line ("Cannot push, stack full");
         return;
      else
         V.Pointer          := V.Pointer + 1;
         V.Data (V.Pointer) := E;
      end if;
   end Push;
   procedure Pop (V : in out Stack; E : out Elem) is
   begin
      if Is_Empty (V) then
         Put_Line ("Cannot pop, stack empty");
         return;
      else
         E         := Top (V);
         V.Pointer := V.Pointer - 1;
      end if;
   end Pop;
   function Top (V : Stack) return Elem is
   begin
      return V.Data (V.Pointer);
   end Top;

   function Is_Empty (V : Stack) return Boolean is
   begin
      return V.Pointer = 0;
   end Is_Empty;
   function Is_Full (V : Stack) return Boolean is
   begin
      return V.Pointer = V.Max;
   end Is_Full;
   function size (V : Stack) return Natural is
   begin
      return V.Pointer;
   end size;

   procedure For_Each (S : in Stack) is
   begin
      for i in S.Data'First .. S.Data'Last loop
         Process_Element (S.Data (i));
      end loop;
   end For_Each;

end stacksgen;
