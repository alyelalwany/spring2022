generic
   type Elem is limited private;
   type Index is (<>);
   type TArray is array(Index range <>) of Elem;
   with procedure Swap(A,B: in out Elem);
procedure reversalgenlimited(T: in out TArray);
