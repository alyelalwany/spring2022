with morethanonce, doubleslimited;
with Ada.Text_IO; use Ada.Text_IO;
procedure morethanonce_demo is
   type TArray is array (Integer range <>) of Integer;
   procedure repeated is new morethanonce (Integer, Integer, TArray);
   T      : TArray (1 .. 7) := (2, 1, 3, 4, 5, 6, 1);
   Flag   : Boolean         := False;
   index1 : Integer         := 0;
   index2 : Integer         := 0;


   procedure double is new doubleslimited (Integer, Integer, TArray);
begin

   double (T, Flag, index1, index2);
   New_Line;
   if Flag then
      Put_Line
        ("Found at " & Integer'Image (index1) & " and " &
         Integer'Image (index2));
   else
      Put_Line ("No doubles");
   end if;

end morethanonce_demo;
