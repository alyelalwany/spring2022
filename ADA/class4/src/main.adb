with Setq, Ada.Integer_Text_IO, Ada.Text_IO, pqueue, Bag, BagRecord;
use Setq,Ada.Integer_Text_IO, Ada.Text_IO,pqueue, Bag, BagRecord;
with Ada.Numerics.Discrete_Random;

procedure Main is
   R  : Rational := 4 / 8;
   R2 : Rational := 1 / 2;
   --  q : Queue(10);
   B2: TBag;

   subtype Random_Range is Integer range 1 ..10;
   package Randomizer is new
     Ada.Numerics.Discrete_Random (Random_Range);
   use Randomizer;
   G: Generator;

begin
   Reset(G);

   Put_Line("Bag record testing <<<<<<<<<<<<<<<<<<<<<<<<<<");
   for I in 1..100 loop
      insertMultiple(B2,I,Random(G));
   end loop;
   print(B2);
   for I in 1..100 loop
      extractMultiple(B2,I,Random(G));
   end loop;
   print(B2);
   Put(Natural'Image(Size(B2)));
end Main;
