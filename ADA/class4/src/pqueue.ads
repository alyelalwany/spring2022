package pqueue is

   type Queue(Max : Positive) is limited private;
   subtype Elem is Integer;
   
   function take(q : in out Queue) return Elem;
   function insert(q : in out Queue; e : in Elem) return Boolean;
   function isEmpty(q:Queue) return Boolean;
   function isFull(q:Queue) return Boolean;
   function size(q: Queue) return Natural;
private
   
   type TArray is array (Integer range <>) of Elem;
   type Queue (Max: Positive) is record
      data: TArray(1..Max);
      headPointer, tailPointer: Positive := 1;
      size: Natural := 0;
   end record;
   
end pqueue;
