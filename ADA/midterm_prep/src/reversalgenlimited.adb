procedure reversalgenlimited (T : in out TArray) is
   Start  : Index := T'First;
   Finish : Index := T'Last;
begin
   while Start < Finish loop
      Swap (T (Start), T (Finish));
      Start  := Index'Succ (Start);
      Finish := Index'Pred (Finish);
   end loop;
end reversalgenlimited;
