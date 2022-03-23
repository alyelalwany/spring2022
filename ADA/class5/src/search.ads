generic
   type Elem is private;
   type Index is (<>);
   type TArray is array(Index range <>) of Elem;
   with function prop(a:Elem) return Boolean;
procedure Search(T: TArray; b : out Boolean; j: out Index);
