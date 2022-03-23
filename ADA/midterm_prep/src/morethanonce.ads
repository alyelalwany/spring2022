generic
   type Elem is private;
   type Index is (<>) ;
   type TArray is array(Index range <>) of Elem;
   
procedure morethanonce(T:TArray; bool: out Boolean; index1: out Index; index2: out Index);
