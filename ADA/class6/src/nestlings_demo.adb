with nestlings, Ada.Text_IO;
use Ada.Text_IO;
procedure nestlings_demo is
   type birdsMatrix is array (Integer range <> ,Integer range <>) of Natural;
   function countNewBirds is new nestlings(index  => Integer,
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
   Put_Line(Natural'Image(countNewBirds(Nest)));
end nestlings_demo;
