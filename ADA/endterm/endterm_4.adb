-- Ada Programming - end-term, 2022. May. 5.
-- This solution was submitted and prepared by <Aly Elalwany, WGL13Q> for the end-term assignment of the Ada Programming course.
-- I declare that this solution is my own work.
-- I have not copied or used third-party solutions.
-- I have not passed my solution to my classmates, neither made it public.
-- Students regulation of Eotvos Lorand University (ELTE Regulations Vol. II. 74/C.)
with Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;
procedure endterm_4 is
   subtype from_1_to_10 is Integer range 1 .. 10;
   subtype from_1_to_3 is Integer range 1 .. 3;
   subtype from_1_to_2 is Integer range 1 .. 2;

   type Shows_performed is (Marriage_of_Figaro, Eugene_Onegin);
   type shows_type is array (from_1_to_2) of Shows_performed;
   type positive_access is access Positive;
   type Integer_access is access Integer;
   type opera_id_access is access from_1_to_3;

   package ticket_gen_pack is new Ada.Numerics.Discrete_Random (from_1_to_10);
   package opera_gen_pack is new Ada.Numerics.Discrete_Random (from_1_to_3);
   package show_gen_pack is new Ada.Numerics.Discrete_Random (from_1_to_3);
   protected Printer is
      procedure print (S : in String := "");
   end Printer;
   protected body Printer is
      procedure print (S : in String := "") is
      begin
         Put_Line (S);
      end print;
   end Printer;
   protected Randomizer is
      procedure get_random_float
        (Value : out Float; from : in Float; to : in Float);
      function get_random_tickets return from_1_to_10;
      function get_random_opera return from_1_to_3;
      function get_random_show return from_1_to_2;
   private
      G         : Ada.Numerics.Float_Random.Generator;
      G_tickets : ticket_gen_pack.Generator;
      G_Opera   : opera_gen_pack.Generator;
      G_show    : show_gen_pack.Generator;
   end Randomizer;
   protected body Randomizer is
      procedure get_random_float
        (Value : out Float; from : in Float; to : in Float)
      is
      begin
         Ada.Numerics.Float_Random.Reset (G);
         Value := Ada.Numerics.Float_Random.Random (G) * (to - from) + from;
      end get_random_float;

      function get_random_tickets return from_1_to_10 is
      begin
         ticket_gen_pack.Reset (G_tickets);
         return ticket_gen_pack.Random (G_tickets);
      end get_random_tickets;
      function get_random_opera return from_1_to_3 is
      begin
         opera_gen_pack.Reset (G_Opera);
         return opera_gen_pack.Random (G_Opera);
      end get_random_opera;
      function get_random_show return from_1_to_2 is
      begin
         show_gen_pack.Reset (G_show);
         return show_gen_pack.Random (G_show);
      end get_random_show;
   end Randomizer;

   protected type OperaHouse
     (id : Integer_access; max_capacity : Integer_access) is
      entry buying (nr_of_tickets : Natural; opera_to_attend : from_1_to_2);
      function get_count_tickets return Natural;
      function get_count_people_served return Natural;
   private
      total_tickets_sold  : Natural    := 0;
      current_shows       : shows_type := (Marriage_of_Figaro, Eugene_Onegin);
      total_people_served : Natural    := 0;
   end OperaHouse;
   type opera_access is access OperaHouse;
   operas : array (from_1_to_3) of opera_access;
   protected body OperaHouse is
      entry buying (nr_of_tickets : Natural; opera_to_attend : from_1_to_2)
        when max_capacity.all > 0 is
      begin
         --  current_shows (opera_to_attend);
         total_people_served := total_people_served + 1;
         total_tickets_sold  := total_tickets_sold + nr_of_tickets;
         Printer.print
           ("Person with id " & Positive'Image (id.all) & " has bought " &
            from_1_to_10'Image (nr_of_tickets) & " tickets for " &
            Shows_performed'Image (current_shows (opera_to_attend)));

      end buying;
      function get_count_tickets return Natural is
      begin
         return total_tickets_sold;
      end get_count_tickets;
      function get_count_people_served return Natural is
      begin
         return total_people_served;
      end get_count_people_served;
   end OperaHouse;

   task type Person (id : positive_access);
   task body Person is
      delay_time   : Float;
      rand_tickets : from_1_to_10;
      rand_opera   : from_1_to_3;
      --  rand_opera  : Integer;
      rand_show   : from_1_to_2;
      bought      : Boolean := False;
      nr_of_tries : Integer := 0;
   begin
      Randomizer.get_random_float (delay_time, 2.0, 3.0);

      delay Duration (delay_time);
      rand_tickets := Randomizer.get_random_tickets;
      rand_opera   := (Randomizer.get_random_opera);
      rand_show    := Randomizer.get_random_show;
      while not bought and nr_of_tries < 3 loop
         select
            operas (rand_opera).buying (rand_tickets, rand_show);
            Printer.print
              ("Person bought " & Positive'Image (id.all) & " at " &
               Integer'Image (rand_opera));
            bought := True;
         or
            delay 1.0;
         end select;
         delay 2.0;
      end loop;

      if not bought then
         Printer.print
           ("Person with id " & Positive'Image (id.all) &
            "could not buy tickets");
      end if;
   end Person;

   type person_access is access Person;
   people : array (1 .. 40) of person_access;

begin

   for I in operas'Range loop
      operas (I) := new OperaHouse (new Integer'(I), new Integer'(I * 5));

      delay 0.5;
   end loop;

   for I in people'Range loop
      people (I) := new Person (new Positive'(I));

   end loop;
   delay 4.0;

   for I in 1 .. 3 loop
      if operas (I).get_count_tickets > 0 then
         Printer.print
           ("Opera house #" & Integer'Image (I) & " sold total of " &
            Natural'Image (operas (I).get_count_tickets) &
            " tickets and served " &
            Natural'Image (operas (I).get_count_people_served) & " people ");
      else
         Printer.print
           ("Opera house #" & Integer'Image (I) &
            "could not sell any tickets at all");
      end if;
   end loop;
end endterm_4;
