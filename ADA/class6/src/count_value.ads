generic
   type Elem is private;
   type index is (<>);
   type Vector is Array(Index range <> ,Index range <>) of Elem;
   with function func(E: Elem) return Boolean;
 function count_value(T: Vector) return Natural;

