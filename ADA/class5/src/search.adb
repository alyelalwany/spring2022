procedure Search(T: TArray; b : out Boolean; j: out Index) is
   
begin
   b:= False;
   for i in t'Range loop
      if prop(t(i)) then
         j:= i;
         b:= True;
         exit;
      end if;
   end loop;
end Search; 
