with Ada.Text_IO; use Ada.Text_IO;
with exercises; use exercises;

procedure Main is
   
   T: TArray := (4,1,2,3,5,7,10,8,9,6);
begin
   
   Put_Line("Rec sum: " & Elem'Image(addRec(T)));
   T := bubbleSort(T);
   
   for i in T'Range loop
      Put(Elem'Image(T(i)));
   end loop;
   
  
end Main;
