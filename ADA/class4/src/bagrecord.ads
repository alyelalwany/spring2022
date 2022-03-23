package BagRecord is
   
   subtype Elem is Natural;
   type TBag is limited private;
   procedure insertOne (B: in out TBag; E : in Elem);
   procedure insertMultiple (B: in out TBag; E : in Elem; Count: in Positive);
   procedure extractOne (B: in out TBag; E : in Elem);
   procedure extractMultiple (B: in out TBag; E : in Elem; Count: in Positive);
   function isEmpty(B: TBag) return Boolean;
   procedure print(B :TBag); 
   function  Size(B :TBag) return Natural; 
private
   
   type TArray is array(Integer range <>) of Elem;
   type TBag is record
      Arr: TArray(1..100) := (others=>0);
      size : Natural:= 0;
   end record;
   
end BagRecord;
