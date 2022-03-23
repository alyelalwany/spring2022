package Bag is
     

   subtype Elem is Natural;
   subtype Index is Integer range 1..100 ;
   type BagType is array (Index) of Elem;
   procedure insertOne(B: in out BagType ; E: in Elem);
   procedure insertMultiple(B: in out BagType; E: in Elem; Count: in Positive);
   procedure extractOne(B: in out BagType; E: in Elem);
   procedure extractMultiple(B: in out BagType;E: in Elem; Count: in Positive);
   function isEmpty(B: BagType) return Boolean;
   procedure print(B: BagType);

 
end Bag;
