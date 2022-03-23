with Ada.Integer_Text_IO;
with Ada.Integer_Text_IO;
with Bag;
with Ada.Text_IO; use Ada.Text_IO;
procedure bag_demo is
   package Integer_Bag is new Bag (Elem => Integer);
   package Char_Bag is new Bag (Elem => Character);
   charBag : Char_Bag.BagType (5);
   bag1    : Integer_Bag.BagType (5);
   E       : Integer := 1;
   procedure printElement (N : in out Integer) is
   begin
      Ada.Integer_Text_IO.Put (N);
      Ada.Text_IO.Put (" With Multiplicity ");
      Ada.Integer_Text_IO.Put (Integer_Bag.getMultiplicity (bag1, N));
      Ada.Text_IO.New_Line;
   end printElement;
   procedure printEach is new Integer_Bag.For_Each
     (process_elem => printElement);

   procedure printElement (N : in out Character) is
   begin
      Put (N);
      Put (" With Multiplicity ");
      Put (Integer'Image (Char_Bag.getMultiplicity (charBag, N)));
      Ada.Text_IO.New_Line;
   end printElement;

   procedure printEachChar is new Char_Bag.For_Each
     (process_elem => printElement);

begin

   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   E := 2;
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   E := 3;
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   Integer_Bag.add (bag1, E);
   E := 4;
   Integer_Bag.add (bag1, E);
   E := 5;
   Integer_Bag.add (bag1, E);
   Integer_Bag.print (bag1);
   New_Line;
   printEach (bag1);
   Integer_Bag.print (bag1);

   New_Line;
   Integer_Bag.remove (B => bag1, E => 1);
   Integer_Bag.remove (B => bag1, E => 1);
   Integer_Bag.remove (B => bag1, E => 1);
   Integer_Bag.remove (B => bag1, E => 1);
   Integer_Bag.remove (B => bag1, E => 2);
   Integer_Bag.remove (B => bag1, E => 2);
   Integer_Bag.remove (B => bag1, E => 2);

   Integer_Bag.remove (B => bag1, E => 6);
   Integer_Bag.remove (B => bag1, E => 3);
   Integer_Bag.remove (B => bag1, E => 4);
   Integer_Bag.remove (B => bag1, E => 5);
   Integer_Bag.print (bag1);

   New_Line;
   Char_Bag.add (charBag, 'a');
   Char_Bag.add (charBag, 'a');
   Char_Bag.add (charBag, 'a');
   Char_Bag.add (charBag, 'b');
   Char_Bag.add (charBag, 'c');
   Char_Bag.add (charBag, 'd');
   Char_Bag.add (charBag, 'd');
   Char_Bag.add (charBag, 'd');
   Char_Bag.add (charBag, 'd');
   Char_Bag.add (charBag, 'd');
   Char_Bag.add (charBag, 'd');
   Char_Bag.add (charBag, 'e');
   Char_Bag.print (charBag);
   printEachChar (charBag);
end bag_demo;
