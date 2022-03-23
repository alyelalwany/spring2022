with Swap;
procedure reversalgen (T : in out TArray) is
   procedure MySwap is new Swap (Elem);
   Start  : Index := T'First;
   Finish : Index := T'Last;
begin

   while Start < Finish loop
      MySwap (T (Start), T (Finish));
      Start  := Index'Succ (Start);
      Finish := Index'Pred (Finish);
   end loop;
end reversalgen;
