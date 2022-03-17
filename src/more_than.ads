generic
   type index is (<>);
   type Vector is Array(Index range <> ,Index range <>) of Natural;

 function more_than(T: Vector; Max: Natural) return Boolean;
