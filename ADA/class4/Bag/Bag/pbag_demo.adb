with Pbag, Ada.Text_IO;
use Pbag, Ada.Text_IO;

procedure Pbag_Demo is
   Is_it_Extracted: Boolean;
   B: Bag;
begin
   Insert_multiple(B,1,3);
   Insert_multiple(B,2,4);
   Insert_one(B,3);
   print(B);
   Ada.Text_IO.New_Line;
   Extract_multiple(B,2,3,Is_it_Extracted);
   print(B);
   Ada.Text_IO.New_Line;
   Extract_multiple(B,2,1,Is_it_Extracted);
   Extract_multiple(B,1,3,Is_it_Extracted);
   print(B);
   Ada.Text_IO.New_Line;
   Extract_one(B,3,Is_it_Extracted);
   print(B);
   Ada.Text_IO.New_Line;
end Pbag_Demo;
