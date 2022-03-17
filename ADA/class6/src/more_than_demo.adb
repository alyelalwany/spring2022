with more_than, Ada.Text_IO;
use Ada.Text_IO;
procedure more_than_demo is
   type birdsMatrix is array (Integer range <> ,Integer range <>) of Natural;
   function moreThanMax is new more_than(index  => Integer,
                                             Vector => birdsMatrix); 
   Nest: birdsMatrix (1..10,1..10) := ((1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10)
                                       ,(1,2,3,4,5,6,7,8,9,10));
         
                                      
                                         
begin
   Put_Line(Boolean'Image(moreThanMax(Nest,500)));
   Put_Line(Boolean'Image(moreThanMax(Nest,600)));

end more_than_demo;
