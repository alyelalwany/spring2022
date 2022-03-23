procedure doubleslimited (T : TArray; bool : out Boolean; index1, index2 : out Index)
is
begin
   bool := False;
   for I in T'First..Index'Pred(T'Last) loop
      For J in Index'Succ(I)..T'Last loop
         if T(I) = T(J) then
            bool:=True;
            index1 := I;
            index2 := J;
            return;
         end if;
      end loop;
   end loop;
end doubleslimited;
