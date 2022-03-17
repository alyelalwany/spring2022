generic
   type index is (<>);
   type Vector is Array(Index range <> ,Index range <>) of Natural;

 function nestlings(T: Vector) return Natural;
