generic
   type Elem is private;
   type Index is (<>);
   type TArray is array (Index range <>) of Elem;
procedure reversalgen (T : in out TArray);
