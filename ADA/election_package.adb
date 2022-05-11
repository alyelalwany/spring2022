with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

package body Election_Package is

   procedure Initialize_Regional_Votes (E : in out Election) is
      type newInt is new Integer range 0 .. 50;
      package Rand_Votes is new Ada.Numerics.Discrete_Random (newInt);
      G          : Rand_Votes.Generator;
      randomVote : newInt;
   begin
      for i in E.Regional_Votes'Range (1) loop
         for j in E.Regional_Votes'Range (2) loop
            Rand_Votes.Reset (G);
            randomVote              := Rand_Votes.Random (G);
            E.Regional_Votes (i, j) := Integer (randomVote);
         end loop;
      end loop;
   end Initialize_Regional_Votes;

   procedure Finalize_Votes (E : in out Election) is
      S : Integer := 0;
   begin
      for i in E.Final_Votes'Range loop
         S := 0;
         for j in E.Regional_Votes'Range (1) loop
            for k in E.Regional_Votes'Range (2) loop
               if i = k then
                  S := S + E.Regional_Votes (j, k);
               end if;
            end loop;
         end loop;
         E.Final_Votes (i) := S;
      end loop;
   end Finalize_Votes;

   function Find_First_Place (E : Election) return Candidates is

   begin
      return Find_N_th_Place (E, 1);
   end Find_First_Place;

   function Find_Last_Place (E : Election) return Candidates is
   begin
      return Find_N_th_Place (E, E.Count);
   end Find_Last_Place;

   function Find_N_th_Place (E : Election; N : Integer) return Candidates is
      type TArray is array (Integer range <>) of Integer;
      T1      : TArray (1 .. E.Count) := (others => 0);
      pointer : Integer               := 0;
      Nth     : Integer;
      procedure Bubble_Sort (A : in out TArray) is
         Finished : Boolean;
         Temp     : Integer;
      begin
         loop
            Finished := True;
            for J in A'First .. Integer'Pred (A'Last) loop
               if A (Integer'Succ (J)) > A (J) then
                  Finished             := False;
                  Temp                 := A (Integer'Succ (J));
                  A (Integer'Succ (J)) := A (J);
                  A (J)                := Temp;
               end if;
            end loop;
            exit when Finished;
         end loop;
      end Bubble_Sort;
   begin
      for i in E.Final_Votes'Range loop
         pointer      := pointer + 1;
         T1 (pointer) := E.Final_Votes (i);
      end loop;
      Bubble_Sort (T1);
      Nth := T1 (N);
      for i in E.Final_Votes'Range loop
         if E.Final_Votes (i) = Nth then
            return i;
         end if;
      end loop;
      return Candidates'First;
   end Find_N_th_Place;

   function Calculate_Percentage_Of_Candidate
     (E : Election; C : Candidates) return Float
   is
      Percent : Float;
      total   : Integer := 0;
      spec    : Integer;
   begin
      spec := E.Final_Votes (C);
      for i in E.Final_Votes'Range loop
         total := total + E.Final_Votes (i);
      end loop;
      Percent := Float (spec) / Float (total);
      return Percent * 100.0;
   end Calculate_Percentage_Of_Candidate;

   function Calculate_Regional_Percentage_Of_Candidate
     (E : Election; R : Regions; C : Candidates) return Float
   is
      Percent : Float;
      total   : Integer := 0;
      spec    : Integer;
   begin
      spec := E.Regional_Votes (R, C);
      for i in E.Regional_Votes'Range (2) loop
         total := total + E.Regional_Votes (R, i);
      end loop;
      Percent := Float (spec) / Float (total);
      return Percent * 100.0;
   end Calculate_Regional_Percentage_Of_Candidate;

   function Final_Vote_Of_Candidate
     (E : Election; C : Candidates) return Integer
   is

   begin
      return E.Final_Votes (C);
   end Final_Vote_Of_Candidate;

   function Regional_Vote_Of_Candidate
     (E : Election; R : Regions; C : Candidates) return Integer
   is

   begin
      return E.Regional_Votes (R, C);
   end Regional_Vote_Of_Candidate;

   procedure print (E : Election; B : Boolean := True) is
      V : Integer;
   begin
      if B then
         Put_Line ("Regional Vote Results");
         for i in E.Regional_Votes'Range (1) loop
            Put_Line ("Region: " & i'Image);

            for j in E.Regional_Votes'Range (2) loop
               V := E.Regional_Votes (i, j);
               Put ("Candidate: " & j'Image & " - " & V'Image & ", ");
            end loop;
            New_Line;
         end loop;
      else
         Put_Line ("Final Vote Results");
         for i in E.Final_Votes'Range loop
            V := E.Final_Votes (i);
            Put_Line ("Candidate: " & i'Image & " - " & V'Image);
         end loop;
      end if;
   end print;

   procedure ForEach (E : in out Election; R : Regions) is
      S : Integer;
   begin
      --  for i in E.Regional_Votes'Range(1) loop
      --     if i = r then
      for j in E.Regional_Votes'Range (2) loop
         S                       := Action (E.Regional_Votes (R, j));
         E.Regional_Votes (R, j) := S;
      end loop;
      --  end if;
      --  end loop;
   end ForEach;

   function Compare_Candidates
     (E : Election; C1 : Candidates; C2 : Candidates) return Boolean
   is
      c11 : Integer;
      c22 : Integer;
   begin
      c11 := E.Final_Votes (C1);
      c22 := E.Final_Votes (C2);
      return c11 > c22;
   end Compare_Candidates;

end Election_Package;
