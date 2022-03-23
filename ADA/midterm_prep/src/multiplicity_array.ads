generic
   type Elem is private;
   type Index is (<>);
   type Vector is array(Index range <>) of Elem;
function multiplicity_array(T:Vector) return Natural;
