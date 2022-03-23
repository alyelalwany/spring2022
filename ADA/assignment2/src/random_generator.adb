with Ada.Numerics.Discrete_Random, Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure random_generator is
   package Random_int is new Ada.Numerics.Discrete_Random (Integer);
   G : Random_int.Generator;
begin
   Random_int.Reset(G);

   for i in 1..10 loop
      Put("random Integer : ");
      Put(Random_int.Random(G));
      new_line;
   end loop;
     
end random_generator;
