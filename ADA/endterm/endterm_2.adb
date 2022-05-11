-- Ada Programming - end-term, 2022. May. 5.
-- This solution was submitted and prepared by <Aly Elalwany, WGL13Q> for the end-term assignment of the Ada Programming course.
-- I declare that this solution is my own work.
-- I have not copied or used third-party solutions.
-- I have not passed my solution to my classmates, neither made it public.
-- Students regulation of Eotvos Lorand University (ELTE Regulations Vol. II. 74/C.)
with Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;
procedure endterm_2 is
   subtype from_1_to_10 is Integer range 1 .. 10;
   package ticket_gen_pack is new Ada.Numerics.Discrete_Random (from_1_to_10);
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
   private
      G         : Ada.Numerics.Float_Random.Generator;
      G_tickets : ticket_gen_pack.Generator;
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
      
   end Randomizer;

   protected OperaHouse is
      entry buying (nr_of_tickets : Natural);
      function get_count_tickets return Natural;
      function get_count_people_served return Natural;
   private
      total_tickets_sold : Natural := 0;
      total_people_served: Natural :=0;
   end OperaHouse;
   protected body OperaHouse is
      entry buying (nr_of_tickets : Natural) when True is
      begin
         total_people_served := total_people_served + 1;
         total_tickets_sold := total_tickets_sold + nr_of_tickets;

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

   type positive_access is access Positive;
   task type Person (id : positive_access);
   task body Person is
      delay_time   : Float;
      rand_tickets : from_1_to_10;
      bought       : Boolean := False;
      nr_of_tries  : Integer := 0;
   begin
      Randomizer.get_random_float (delay_time, 2.0, 3.0);
      delay Duration (delay_time);
      rand_tickets := Randomizer.get_random_tickets;
      while not bought and nr_of_tries < 3 loop
         select
            OperaHouse.buying (rand_tickets);
            bought := True;
         or
            delay 0.0;
         end select;
         delay 2.0;
         nr_of_tries := nr_of_tries + 1;
      end loop;

      if bought then
         Printer.print
           ("Person with id " & Positive'Image (id.all) & " has bought " &
            from_1_to_10'Image (rand_tickets) & " tickets");
      else
         Printer.print
           ("Person with id " & Positive'Image (id.all) &
            "could not buy tickets");
      end if;
   end Person;

   type person_access is access Person;
   people : array (1 .. 20) of person_access;

begin
   for I in people'Range loop
      people (I) := new Person (new Positive'(I));
   end loop;
   delay 5.0;
   Printer.print ("We sold total of " & Natural'Image (OperaHouse.get_count_tickets) & " tickets and served "& Natural'Image (OperaHouse.get_count_people_served) &" people " );

end endterm_2;
