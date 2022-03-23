with Ada.Text_IO; use Ada.Text_IO;
function has_repetition (T : Vector) return Boolean is

begin
   if T'Length > 1 then
      for I in T'First .. Index'Pred (T'Last) loop
         if T (I) = T (Index'Succ (I)) then
            return True;
         end if;
      end loop;
   end if;
   return False;
end has_repetition;
