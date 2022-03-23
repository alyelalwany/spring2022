with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Pbag is

   procedure Insert_one(B : in out Bag; N: Integer) is
      A : Integer;
   begin
      if Is_inbag(B, N) = True then
         A := Get_index(B, N);
         B.Data(A).Count := B.Data(A).Count + 1;
      else
         B.Size := B.Size + 1;
         B.Data(B.Size).Number := N;
         B.Data(B.Size).Count := 1;
      end if;
   end Insert_one;

   procedure Insert_multiple(B : in out Bag; N: Integer; Count : Integer) is
      A : Integer;
   begin
      if Is_inbag(B, N) = True then
         A := Get_index(B, N);
         B.Data(A).Count := B.Data(A).Count + Count;
      else
         B.Size := B.Size + 1;
         B.Data(B.Size).Number := N;
         B.Data(B.Size).Count := Count;
      end if;
   end insert_multiple;

   procedure Extract_one(B : in out Bag; N: in Integer; isExtracted : out Boolean) is
      A : Integer;
   begin
      if Is_inbag(B, N) = True then
         A := Get_index(B, N);
         B.Data(A).Count := B.Data(A).Count - 1;
         if B.Data(A).Count <= 0 then
             for i in A..B.Size loop
                 B.Data(i).Number := B.Data(i+1).Number;
                 B.Data(i).Count := B.Data(i+1).Count;
             end loop;
         B.Size := B.Size - 1;
         end if;
         isExtracted := True;
      else
         isExtracted := False;
      end if;
   end Extract_one;


   procedure Extract_multiple(B : in out Bag; N: in Integer; Count : in Integer; isExtracted: out Boolean) is
   A : Integer;
   begin
      if Is_inbag(B, N) = True then
         A := Get_index(B, N);
         B.Data(A).Count := B.Data(A).Count - Count;
         if B.Data(A).Count <= 0 then
             for i in A..B.Size loop
                 B.Data(i).Number := B.Data(i+1).Number;
                 B.Data(i).Count := B.Data(i+1).Count;
            end loop;
            B.Size := B.Size - 1;
         end if;
         isExtracted := True;
      else
         isExtracted := False;
      end if;
   end Extract_multiple;

   function Is_empty(B:Bag) return Boolean is
   begin
      return B.Size = 0;
   end Is_empty;

   function Is_inbag(B : Bag; N : Integer) return Boolean is
      Is_in_bag : Boolean := False;
   begin
      for i in 1..B.Size loop
         if(N = B.Data(i).Number) then
            Is_in_bag := True;
         end if;
      end loop;
      return Is_in_bag;
   end Is_inbag;

   function Get_index(B : Bag; N : Integer) return Integer is
      Ind : Integer;
   begin
      for i in 1..B.Size loop
         if(N = B.Data(i).Number) then
            Ind := i;
         end if;
      end loop;
      return Ind;
   end Get_index;

   procedure Print(B : in Bag) is
   begin
      if Is_empty(B) = False then
         for i in 1..B.Size loop
            Put("(" & Integer'Image(B.Data(i).Number) & "," & Integer'Image(B.Data(i).Count) & ")");
         end loop;
      else
         Put("The Bag is Empty");
      end if;
   end Print;

end Pbag;
