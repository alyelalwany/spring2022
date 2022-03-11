with Ada.Integer_Text_IO;
with Ada.Text_IO;
procedure Main is
   X: Integer;


begin
   Ada.Integer_Text_IO.Get(X);

   if X>0 then
      Ada.Integer_Text_IO.Put(1);
   elsif X=0 then
      Ada.Integer_Text_IO.Put(0);
   else
      Ada.Integer_Text_IO.Put(-1);
   end if;

   Ada.Integer_Text_IO.Get(X);
   Ada.Text_IO.New_Line;
   if X mod 2 =0 then
      Ada.Text_IO.Put("Even");
   else
      Ada.Text_IO.Put("Odd");
   end if ;
end Main;
