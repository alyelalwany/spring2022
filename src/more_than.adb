function more_than(T: Vector; Max: Natural) return Boolean is
   Count : Natural := 0;
begin
   
   for I in T'Range(1) loop
      for J in T'Range(2) loop
         if Count > Max then
            return True;
         end if;
         Count := Count + T(I,J);
      end loop;
   end loop;
   return False;
end;
