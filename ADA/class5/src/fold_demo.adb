with Fold, Ada.Text_IO;
use Ada.Text_IO;
procedure fold_demo is
   type Elem is new Integer;
   type Index is new Integer;
   type T is array (Index range <>) of Elem;

   function Sum is new Fold (Elem, Index, T, "+", 0);
   function Prod is new Fold (Elem, Index, TArray => T, Op => "+", Start => 0);
begin

   Put_Line (Elem'Image (Sum ((3, 2, 5, 7, 1))));
   Put_Line (Elem'Image (Prod ((3, 2, 5, 7, 1))));
end fold_demo;
