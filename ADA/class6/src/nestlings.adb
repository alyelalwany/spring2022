function nestlings(T: Vector) return Natural is 
   Count: Natural := 0;
  
begin
   for I in T'Range(1) loop
      for J in T'Range(2) loop
         Count := Count + T(I,J);
      end loop;
   end loop;
   return Count;
end nestlings;
