with max_pos, Swap;
procedure Sort (T : in out TA) is
   procedure My_Swap is new Swap (Elem);
   function Max_Position is new max_pos (Elem, Index, TA);
   MaxIndex : Index;
begin
   for I in reverse T'Range loop
      MaxIndex := Max_Position (T(T'First..I));
      My_Swap (T (I), T (MaxIndex));
   end loop;
end Sort;
