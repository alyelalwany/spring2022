with Ada.Text_IO, Election_Package;
use Ada.Text_IO;

procedure election_main is
   type Candidates is (Rasul, Bill, Jill, Will, Nill);
   type Regions is (Budapest, Pecs, Gyor, Debrecen, Szeged);

   package My_Election is new Election_Package (Candidates, Regions);
   use My_Election;

   function myaction (NV : Integer) return Integer is
   begin
      if NV < 10 then
         return 0;
      else
         return NV - 10;
      end if;
   end myaction;

   procedure RemovingVotes is new ForEach (myaction);

   A : Election (5);
   B : Election (5);

   F : Float := 0.0;
begin
   Put_Line ("Initializing Regional votes for Election A");
   Initialize_Regional_Votes (A);
   Put_Line ("Printing Regional votes for Election A");
   print (A);
   Finalize_Votes (A);
   Put_Line ("Printing Final votes for Election A");
   print (A, False);

   RemovingVotes (A, Budapest);
   Finalize_Votes (A);
   Put_Line ("Printing Regional votes for Election A");
   print (A);
   Put_Line
     ("Printing Final votes for Election A after Removing 10 votes from Budapest");
   print (A, False);

   Put_Line ("Printing percentage of winning of Rasul");
   Put_Line (Calculate_Percentage_Of_Candidate (A, Rasul)'Image);

   Put_Line ("Printing regional percentage of winning of Rasul");
   Put_Line
     (Calculate_Regional_Percentage_Of_Candidate (A, Budapest, Rasul)'Image);

   Put_Line
     ("For checking purposes all percentages of individuals should add up to 100 -> ");
   for i in Candidates'Range loop
      F := F + Calculate_Percentage_Of_Candidate (A, i);
   end loop;
   Put_Line (F'Image);

   Put_Line ("First place");
   Put_Line (Find_First_Place (A)'Image);

   Put_Line ("5th place");
   Put_Line (Find_N_th_Place (A, 5)'Image);

   Put_Line ("Last place");
   Put_Line (Find_Last_Place (A)'Image);

   Put_Line ("Comparing Candidates");
   Put_Line ("Printing percentage of winning of Jill");
   Put_Line (Calculate_Percentage_Of_Candidate (A, Jill)'Image);
   Put_Line ("Printing percentage of winning of Bill");
   Put_Line (Calculate_Percentage_Of_Candidate (A, Bill)'Image);
   Put_Line (Compare_Candidates (A, Jill, Bill)'Image);

   --Put_Line("Initializing Regional votes for Election B");
   Initialize_Regional_Votes (B);
end election_main;
