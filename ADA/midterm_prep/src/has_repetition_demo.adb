with has_repetition;
with Ada.Text_IO; use Ada.Text_IO;
procedure has_repetition_demo is
   function Has_Double_Letters is new has_repetition
     (Elem => Character, Index => Positive, Vector => String);
   S  : String := "idonthaverepetition";
   S1 : String := "iihaverepetition";
   S2 : String := "ihaverepetitionn";
begin
   New_Line;
   if Has_Double_Letters (S) then
      Put_Line ("It has repetition");
   end if;
   New_Line;
   if Has_Double_Letters (S1) then
      Put_Line ("It has repetition");
   end if;
   New_Line;
   if Has_Double_Letters (S2) then
      Put_Line ("It has repetition");
   end if;

end has_repetition_demo;
