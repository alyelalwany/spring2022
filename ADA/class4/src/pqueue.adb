package body pqueue is
   

   function take (q: in out Queue) return Elem is 
      result : Elem;
   begin
      if isEmpty(q) then
         result := -1;
      else
         result := q.data(q.headPointer);
         q.headPointer := (q.headPointer mod q.Max ) +1;
         q.size := q.size-1;
      end if;
      return result;
   end;
   
   function insert(q : in out Queue; E: in Elem) return Boolean is
   begin
      if isFull(q) then
         return False;
      else	 
         q.data(q.tailPointer) := E;
         q.tailPointer := (q.tailPointer mod q.Max ) +1;
         q.size := q.size +1;
      end if;
      return True;
   end;
   function isFull(q:Queue) return Boolean is
   begin
      return size(q) = q.Max;
   end;
   
   function isEmpty(q:Queue) return Boolean is
   begin
      return size(q) = 0;
   end;
   
   function size( q: Queue) return Natural is 
   begin
      return q.size;
   end;
end pqueue;
