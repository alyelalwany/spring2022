function most_frequent (T : Vector) return Elem is
   function Multiplicity (Pattern : Elem;J : Index) return Natural is
      count : Natural := 0;
   begin
      for I in reverse T'First .. J loop
         if Pattern = T (I) then
            count := count + 1;
         end if;
      end loop;
      return count;
   end Multiplicity;
   P : Natural := 0;
   X : Elem;
begin
   for I in T'First .. T'Last loop
      if P < Multiplicity (T (I),I) then
         X := T (I);
         P := Multiplicity (T (I),I);
      end if;
   end loop;
   return X;
end most_frequent;
