with most_frequent;
with Ada.Text_IO; use Ada.Text_IO;
procedure most_frequent_demo is

   function mymostfrequent is new most_frequent(Elem   => Character,
                                                Index  => Positive,
                                                Vector => String );
   S  : String := "hello,amgoinghome";
   S1  : String := "hhhaaakkkeeewww";
begin
   Put_Line("Element of most occurence is " & Character'Image(mymostfrequent(S)));
   
end most_frequent_demo;
