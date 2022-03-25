with Car_Package;
package body registration_package is

   procedure addCar (R : in out Registration; C : in Car) is
   begin
      if R.size /= R.Max then
         R.size          := R.size + 1;
         R.Cars (R.size) := C;
      end if;
   end addCar;

   procedure printAllCars (R : Registration) is
   begin
      for I in R.Cars'First .. R.size loop
         Car_Package.Print_Car (R.Cars (I));
      end loop;
   end printAllCars;

   function daysRented (R : Registration; Name : String) return Natural is
      day : Natural := 1;
   begin
      for I in R.Cars'First .. R.size loop
         if Car_Package.Get_Name (R.Cars (I)) = Name then
            day :=
              day + Car_Package.Get_Last_Day (R.Cars (I)) -
              Car_Package.Get_First_Day (R.Cars (I));
         end if;
      end loop;
      return day;
   end daysRented;

   function timesRented (R : Registration; Name : String) return Natural is
      Count : Natural := 0;
   begin
      for I in R.Cars'First .. R.size loop
         if Car_Package.Get_Name (R.Cars (I)) = Name then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end timesRented;

   function allTotalDays (R : Registration) return Natural is
      Counter : Natural := 0;
      type countArray is array (Integer range <>) of Boolean;
      counterArr : countArray (1 .. 30) := (others => False);
   begin
      for I in R.Cars'First .. R.size loop
         for J in Get_First_Day (R.Cars (I)) .. Get_Last_Day (R.Cars (I)) loop
            counterArr (J) := True;
         end loop;
      end loop;
      For I in counterArr'Range loop
         if counterArr(I) then
            Counter := Counter + 1 ;
         end if;
      end loop;
      return Counter;
   end allTotalDays;

   --  function mostRentedCar (R : Registration) return String is
   --     Mh : Positive := 1;
   --  begin
   --     for i in R.Cars'First .. R.size loop
   --        if Get_Last_Day (R.Cars (i)) - Get_First_Day (R.Cars (i)) >
   --          Get_Last_Day (R.Cars (Mh)) - Get_First_Day (R.Cars (Mh))
   --        then
   --           Mh := i;
   --        end if;
   --     end loop;
   --     return Get_Name (R.Cars (Mh));
   --  end mostRentedCar;

   function mostRentedCar (R : Registration) return String is
      MaxIndex : Positive := 1;
   begin
      for i in R.Cars'First .. R.size loop
         if timesRented (R, Get_Name (R.Cars (i))) >
           timesRented (R, Get_Name (R.Cars (MaxIndex)))
         then
            MaxIndex := i;
         end if;
      end loop;
      return Get_Name (R.Cars (MaxIndex));
   end mostRentedCar;

   function mostRentedDay (R : Registration) return Natural is
      type countArray is array (Integer range <>) of Natural;
      maxDayIndex : Integer;
      counter     : countArray (1 .. 30) := (others => 0);
   begin
      for i in R.Cars'First .. R.size loop
         for j in Get_First_Day (R.Cars (i)) .. Get_Last_Day (R.Cars (i)) loop
            counter (j) := counter (j) + 1;
         end loop;
      end loop;
      maxDayIndex := counter'First;
      for i in counter'Range loop
         if counter (maxDayIndex) < counter (i) then
            maxDayIndex := i;
         end if;
      end loop;
      return Natural (maxDayIndex);
   end mostRentedDay;

   function notRentedCarDay (R : Registration) return Integer is
      type countArray is array (Integer range <>) of Natural;
      zeroIndex : Integer              := -1;
      counter   : countArray (1 .. 30) := (others => 0);
   begin
      for i in R.Cars'First .. R.size loop
         for j in Get_First_Day (R.Cars (i)) .. Get_Last_Day (R.Cars (i)) loop
            counter (j) := counter (j) + 1;
         end loop;
      end loop;
      for i in counter'Range loop
         if counter (i) = 0 then
            zeroIndex := i;
            exit;
         end if;
      end loop;
      return zeroIndex;
   end notRentedCarDay;

   function Size (R : Registration) return Natural is
   begin
      return R.size;
   end Size;

end registration_package;
