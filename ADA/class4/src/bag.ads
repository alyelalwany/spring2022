package Bag is
     
   function insert_one(B: BagType ; E: Elem) return BagType;
   function insert_multiple(B: BagType; E:Elem; Count: Positive) return BagType; 
   function extract_one(B: BagType; E: Elem) return Elem;
   function extract_multiple(B: BagType;E:Elem; Count: Positive) return BagType;
   function is_empty(B: BagType) return Boolean;
   procedure printBag(B: BagType);
      
   
private   
   subtype Elem is Natural;
   subtype Index is range 1..100 ;
   type BagType is array (Index) of Natural;
end Bag;
