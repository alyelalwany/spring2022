with Ada.Text_IO; use Ada.Text_IO;
with count_value;
procedure count_value_demo is
   type birdsMatrix is array (Integer range <> ,Integer range <>) of Natural;
   function myProp(E: Integer) return Boolean is
   begin
      return E > 3;
   end;
   
   function countMoreThan3 is new count_value(Elem=> Natural,
                                         index  => Integer,
                                         Vector => birdsMatrix,
                                        func=>myProp); 
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
   Put_Line(Natural'Image(countMoreThan3(Nest)));
   
end count_value_demo;
