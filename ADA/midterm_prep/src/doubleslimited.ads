generic
   type Elem is limited private;
   type Index is (<>);
   type TArray is array (Index range <>) of Elem;
   with function "=" (A, B : Elem) return Boolean is <>;
procedure doubleslimited (T : TArray; bool : out Boolean; index1, index2 : out Index);
