package Pbag is
   subtype Elem is Integer;
   type Bag is limited private;
   type Item is limited private;
   procedure Insert_one(B : in out Bag; N: Integer);
   procedure Insert_multiple(B : in out Bag; N: Integer; Count : Integer);
   procedure Extract_one(B : in out Bag; N: in Integer; isExtracted : out Boolean);
   procedure Extract_multiple(B : in out Bag; N: in Integer; Count : in Integer; isExtracted: out Boolean);
   function Is_empty(B : Bag) return Boolean;
   function Is_inbag(B : Bag; N : Integer) return Boolean;
   function Get_index(B : Bag; N : Integer) return Integer;
   procedure Print(B : in Bag);
private
   type Item is record
      Number: Integer;
      Count : Integer;
   end record;
   type arr is array( Integer range <> ) of Item;
   type Bag is record
      Data: arr(1..1000);
      Size: Natural := 0;
   end record;
end Pbag;
