with Swap, Ada.Text_IO;
use Ada.Text_IO;

procedure Swap_demo is
   procedure Int_Swap is new Swap (Integer);
   procedure Float_Swap is new Swap (Float);

   X : Integer := 4;
   Y : Integer := 2;
   U : Float   := 1.9;
   C : Float   := 2.1;

begin
   Int_Swap (A => X, B => Y);
   Float_Swap (A => U, B => C);

   Put_Line (" X: " & Integer'Image (X) & " Y: " & Integer'Image (Y));
   Put_Line (" U: " & Float'Image (U) & " C: " & Float'Image (C));

end Swap_demo;
