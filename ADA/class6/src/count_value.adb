function count_value(T: Vector) return Natural is
   Count : Natural := 0;
begin
  for I in T'Range(1) loop
      for J in T'Range(2) loop
         if func(T(I,J))  then
            Count := Count +1;
         end if;
      end loop;
   end loop;
   return Count;
end count_value;
