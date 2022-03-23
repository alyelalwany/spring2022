function max_pos (T : TA) return Index is
   MaxElem : Index := T'First;
begin
   for i in T'First .. T'Last loop
      if T (MaxElem) < T (i) then
         MaxElem := i;
      end if;
   end loop;
   return MaxElem;
end max_pos;
