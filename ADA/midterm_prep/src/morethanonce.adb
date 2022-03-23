procedure morethanonce
  (T : TArray; bool : out Boolean; index1 : out Index; index2 : out Index)
is
begin
   bool := False;

   for i in T'First .. Index'Pred (T'Last) loop
      for j in Index'Succ (i) .. T'Last loop
         if T (j) = T (i) then
            bool   := True;
            index1 := i;
            index2 := j;
         end if;
      end loop;
   end loop;
end morethanonce;
