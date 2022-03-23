with reversalgen, Ada.Text_IO,reversalgenlimited;
use Ada.Text_IO;
procedure reversal_demo is
   type TArray is array (Integer range <>) of Integer;
   procedure myReverse is new reversalgen (Integer, Integer, TArray);
   myarray  : TArray (1 .. 10) := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
   myarray2 : TArray           := (1, 2);

   procedure mySwap (A, B : in out Integer) is
      Tmp : Integer := A;
   begin
      A := B;
      B := Tmp;
   end mySwap;
   type TArray2 is array (Integer range <>) of Integer;
   procedure myLimitedReverse is new reversalgenlimited
     (Integer, Integer, TArray2,mySwap);
   myarray3  : TArray2 (1 .. 10) := (10, 20, 30, 40, 50, 60, 70, 80, 90, 100);
begin
   New_Line;
   myReverse (myarray);
   for i in myarray'Range loop
      Put (Integer'Image (myarray (i)));
   end loop;
   New_Line;
   myReverse (myarray2);
   for i in myarray2'Range loop
      Put (Integer'Image (myarray2 (i)));
   end loop;
   New_Line;
   
   myLimitedReverse(myarray3);
   
    for i in myarray3'Range loop
      Put (Integer'Image (myarray3 (i)));
   end loop;
   
end reversal_demo;
