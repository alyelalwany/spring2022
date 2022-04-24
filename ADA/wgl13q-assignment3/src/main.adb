with Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random, Ada.Numerics
  .Discrete_Random;
use Ada.Text_IO, Ada.Calendar;

procedure Main is

   type Vaccine is (Pfizer, Sinopharm, Sputnik, Janssen);
   type VaccineArray is array (Vaccine) of Vaccine;
   secondDose : VaccineArray := (Sinopharm, Janssen, Pfizer, Sinopharm);

   package RandomVaccineGenerator is new Ada.Numerics.Discrete_Random
     (Vaccine);

   subtype NumberOfDoses is Integer range 2 .. 3;
   package RandomDosesGenerator is new Ada.Numerics.Discrete_Random
     (NumberOfDoses);

   subtype NumberOfHospitals is Integer range 1 .. 3;
   package RandomHospitalGenerator is new Ada.Numerics.Discrete_Random
     (NumberOfHospitals);

   type PStr is access String;
   type Duration_Access is access Duration;
   protected Printer is
      procedure Print (s : in String := "");
   end Printer;

   protected body Printer is
      procedure Print (s : in String := "") is
      begin
         Put_Line (s);
      end Print;
   end Printer;

   protected Controller is
      function getRandomDose return NumberOfDoses;
      function getRandomVaccine return Vaccine;
      function getRandomHospital return NumberOfHospitals;
      function getRandomFloat return Float;
   end Controller;

   protected body Controller is

      function getRandomDose return NumberOfDoses is
         G : RandomDosesGenerator.Generator;
      begin
         RandomDosesGenerator.Reset (G);
         return RandomDosesGenerator.Random (Gen => G);
      end getRandomDose;

      function getRandomVaccine return Vaccine is
         G : RandomVaccineGenerator.Generator;
      begin
         RandomVaccineGenerator.Reset (G);
         return RandomVaccineGenerator.Random (G);
      end getRandomVaccine;

      function getRandomHospital return NumberOfHospitals is
         G : RandomHospitalGenerator.Generator;
      begin
         RandomHospitalGenerator.Reset (G);
         return RandomHospitalGenerator.Random (Gen => G);
      end getRandomHospital;

      function getRandomFloat return Float is
         G : Ada.Numerics.Float_Random.Generator;
      begin
         Ada.Numerics.Float_Random.Reset (G);
         return Ada.Numerics.Float_Random.Random (G);
      end getRandomFloat;

   end Controller;

   task type Patient (name : PStr; previousDose : Vaccine);

   task type Hospital is

      entry Go_in;

      entry Go_out;

      entry vaccineAvailable
        (vaccineRequested : in Vaccine; response : out Boolean);

      entry decreaseVaccineOfDose (vaccineToDecrease : in Vaccine);

      entry close_hospital (Index : Integer);

   end Hospital;

   type Hospital_Access is access Hospital;
   type Patient_Access is access Patient;

   task body Hospital is
      type vaxStock is array (Vaccine) of NumberOfDoses;
      vaccineStorage : vaxStock :=
        (Controller.getRandomDose, Controller.getRandomDose,
         Controller.getRandomDose, Controller.getRandomDose);
      inside   : Natural := 0;
      openTime : Float   := Controller.getRandomFloat;
      open     : Boolean := False;
      count    : Natural := 0;
   begin
      delay Duration (openTime);
      open := True;
      while open loop
         delay 0.5;
         select when inside < 4 =>
            accept Go_in do
               inside := inside + 1;
            end Go_in;
            --  end select ;
            --  select
         or
            accept vaccineAvailable
              (vaccineRequested : in Vaccine; response : out Boolean)
            do
               if vaccineStorage (vaccineRequested) > 0 then
                  response := True;
               end if;
            end vaccineAvailable;
         or
            accept decreaseVaccineOfDose (vaccineToDecrease : in Vaccine) do
               if vaccineStorage (vaccineToDecrease) > 0 then
                  vaccineStorage (vaccineToDecrease) :=
                    vaccineStorage (vaccineToDecrease) - 1;
                  count := count + 1;
               end if;
            end decreaseVaccineOfDose;
            --  end select;
            --  end Go_in;
         or
            accept Go_out do
               inside := inside - 1;
            end Go_out;
         or
            accept close_hospital (Index : Integer) do
               open := False;
               Printer.Print
                 ("Hospital " & Index'Image & " : did " & count'Image &
                  " vaccines today ");
            end close_hospital;
         or
            delay 0.5;
         end select;
      end loop;
   end Hospital;

   Hospitals : array (1 .. 3) of Hospital_Access;
   Patients  : array (1 .. 15) of Patient_Access;

   task body Patient is
      vaccineFound    : Boolean           := False;
      gotVaccinated   : Boolean           := False;
      doseToGet       : Vaccine           := secondDose (previousDose);
      hospitalToVisit : NumberOfHospitals := Controller.getRandomHospital;
      I               : Integer           := 0;
   begin

      while not gotVaccinated and I < 2 loop
         Hospitals (hospitalToVisit).vaccineAvailable
           (doseToGet, vaccineFound);
         if vaccineFound then
            select
               Hospitals (hospitalToVisit).Go_in;
               Hospitals (hospitalToVisit).decreaseVaccineOfDose
                 (previousDose);
               Hospitals (hospitalToVisit).Go_out;
               Printer.Print
                 ("Patient: " & name.all & " got vaccinated with " &
                  Vaccine'Image (doseToGet));
               gotVaccinated := True;
            or
               delay 0.5;
            end select;
         end if;
         I := I + 1;
      end loop;
      if not gotVaccinated then
         Printer.Print
           ("Patient: " & name.all & " could not get " &
            Vaccine'Image (doseToGet) & " today");
      end if;
   exception
      when Tasking_Error =>
         Printer.Print ("Patient Error : Hospital closed ?");
   end Patient;

   task simulatePatients;
   task body simulatePatients is
   begin
      for I in Patients'Range loop

         Patients (I) :=
           new Patient
             (new String'("Patient # " & Integer'Image (I)),
              Controller.getRandomVaccine);
         delay 0.5;
      end loop;
   end simulatePatients;

   task simulateHospitals;
   task body simulateHospitals is
      count : Natural := 0;
   begin

      for I in Hospitals'Range loop
         Hospitals (I) := new Hospital;
         delay 0.2;
      end loop;
      delay 12.0;
      for I in Hospitals'Range loop
         Hospitals (I).close_hospital (I);
      end loop;

   end simulateHospitals;

begin

   null;
end Main;
