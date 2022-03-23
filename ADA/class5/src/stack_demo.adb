with Stacks, Ada.Command_Line, Ada.Integer_Text_IO, Ada.Float_Text_IO, Integer_Stack;
with Ada.Text_IO; use Ada.Text_IO;
--  use Integer_Stack;
procedure stack_demo is
   package Float_Stack is new Stacks (Float);
   use Float_Stack;
   N : Integer;
   F : Float;
   V : Integer_Stack.Stack (Ada.Command_Line.Argument_Count);
   W : Float_Stack.Stack (Ada.Command_Line.Argument_Count);
begin

   for I in 1 .. Ada.Command_Line.Argument_Count loop
      N := Integer'Value (Ada.Command_Line.Argument (I));
      Integer_Stack.Push (V, N);
      Put_Line(Integer'Image(N));
   end loop;
   while not Integer_Stack.isEmpty (V) loop
      Integer_Stack.pop (V, N);
      F := Float (N)/ 2.0 ;
      push (W, F);
   end loop;
   while not isEmpty (W) loop
      pop (W, F);
      Ada.Float_Text_IO.Put (F);
   end loop;

end stack_demo;
