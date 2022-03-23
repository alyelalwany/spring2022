with Stacks, Integer_Stack, Stacksgen, Ada.Command_Line, Ada
  .Integer_Text_IO, Ada.Float_Text_IO;

procedure stacksdemo is
   package Float_Stack is new Stacks (Float);
   use Float_Stack;
   N : Integer;
   F : Float;
   V : Integer_Stack.Stack (Ada.Command_Line.Argument_Count);
   W : Float_Stack.Stack (Ada.Command_Line.Argument_Count);

   package IStacks is new Stacksgen (Integer);
   procedure Put_Int (Item : Integer) is
   begin
      Ada.Integer_Text_IO.Put (Item);
   end Put_Int;
   procedure Put_Stack is new IStacks.For_Each (Put_Int);
   S : IStacks.Stack (5);
begin
   for I in 1 .. Ada.Command_Line.Argument_Count loop
      N := Integer'Value (Ada.Command_Line.Argument (I));
      Integer_Stack.Push (V, N);
   end loop;
   while not Integer_Stack.is_Empty (V) loop
      Integer_Stack.Pop (V, N);
      F := Float (N) / 2.0;
      Push (W, F);
   end loop;
   while not Float_Stack.is_Empty (W) loop
      Pop (W, F);
      Ada.Float_Text_IO.Put (F);
   end loop;

   IStacks.Push (S, 3);
   IStacks.Push (S, 5);
   IStacks.Push (S, 7);
   IStacks.Push (S, 11);
   IStacks.Push (S, 13);
   Put_Stack (S);
end stacksdemo;
