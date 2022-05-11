generic
   type Candidates is (<>);
   type Regions is (<>);
package Election_Package is

   type Election(Count : Integer) is limited private;

   -- Grade 2
   procedure Initialize_Regional_Votes (E : in out Election);
   procedure Finalize_Votes (E : in out Election);
   function Final_Vote_Of_Candidate(E : Election; C : Candidates) return Integer;
   function Regional_Vote_Of_Candidate(E : Election; R : Regions; C : Candidates) return Integer;

   -- Grade 3
   function Find_First_Place (E : Election) return Candidates;
   function Find_Last_Place (E : Election) return Candidates;
   function Find_N_th_Place (E : Election; N : Integer) return Candidates;
   function Compare_Candidates (E : Election; C1 : Candidates; C2 : Candidates) return Boolean;

   -- Grade 4
   function Calculate_Percentage_Of_Candidate (E : Election; C : Candidates) return Float;
   function Calculate_Regional_Percentage_Of_Candidate (E : Election; R : Regions; C : Candidates) return Float;
   procedure print (E : Election; B : Boolean := True);

   -- Grade 5
   generic
      with function Action ( V : Integer ) return Integer;
   procedure ForEach ( E : in out Election; R : Regions );

private
   type Regional_Vote_Arr is array( Regions, Candidates ) of Integer;
   type Vote_Arr is array( Candidates ) of Integer;

   type Election(Count : Integer) is record
      Regional_Votes : Regional_Vote_Arr;
      Final_Votes : Vote_Arr := (others => 0);
   end record;

end Election_Package;
