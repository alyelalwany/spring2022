with Ada.Text_IO;
use Ada.Text_IO;

procedure Sum is
   
   type Index is new Integer;
   type Elem is new Integer;
   type Array_type is array (Index range <>) of Elem;
   
   function Add_all (arr : Array_type) return Elem is 
      s: Elem := 0;
   begin
      for i in arr'Range loop
         s := s + arr(i);
      end loop;
      return s;
   end Add_all;
 
begin
   
       Put_Line( Elem'Image( Add_all((3,2,5,7,1)) ) );

 
end Sum;
