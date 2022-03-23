function multiplicity_array (T : Vector) return Natural is
   type MultiplicityArrayType is array (Index range <>) of Natural;
   MultiplicityArray : MultiplicityArrayType (T'First .. T'Last) :=
     (others => 1);
   function multiplicity (E : Elem; j : Index) return Natural is
      Count : Natural := 0;
   begin
      for I in reverse T'First .. j loop
         if T (I) = E then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end multiplicity;
   MaxIndex : Index;
begin
   for I in T'First .. T'Last loop
      MultiplicityArray (I) := multiplicity (T (I), I);
   end loop;
   MaxIndex := MultiplicityArray'First;
   for I in Index'Succ (T'First) .. T'Last loop
      if MultiplicityArray (MaxIndex) < MultiplicityArray (I) then
         MaxIndex := I;
      end if;
   end loop;

   return MultiplicityArray (MaxIndex);
end multiplicity_array;
