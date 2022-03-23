with Ada.Text_IO; use Ada.Text_IO;
with multiplicity_array;
procedure multiplicity_array_demo is
   type TArray is array(Integer range <>) of Integer;
   function mymultiplicity is new multiplicity_array(Elem   => Integer,
                                                     Index  => Integer,
                                                     Vector => TArray);
   
   function mystringmultiplicity is new multiplicity_array(Elem   => Character,
                                                     Index  => Positive,
                                                     Vector => String);
   T:TArray(1..10) := (1,2,3,1,6,1,2,2,2,9);
   MyName:String := "Notyourfavoriteguyoneaoooooorth";
begin
   Put_Line(Natural'Image(mymultiplicity(T)));
   Put_Line(Natural'Image(mystringmultiplicity(MyName)));   
   
end multiplicity_array_demo;
