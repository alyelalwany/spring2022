with maximum, Ada.Text_IO;
use Ada.Text_IO;

procedure max_demo is 
   function I_MAX is new maximum(Integer, "<");
   function I_MIN is new maximum(Integer, ">"); 
   -- if we flip the sign it checks if a > b then return b.
   
begin
   
   
   Put_Line(Integer'Image( I_MAX(A => 3,
                                 B => 28)));
   Put_Line(Integer'Image( I_MIN(A => 3,
                                 B => 28)));
   
end max_demo;
