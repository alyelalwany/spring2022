with fold, Map, Maximum, Search, Sort, Ada.Text_IO;
use Ada.Text_IO;
procedure Main is

   -- Fold Demo
   type FoldIndex is new Integer;
   type FoldElem is new Integer;
   type FoldT is array (FoldIndex range <>) of FoldElem;
   function Sum is new fold (FoldElem, FoldIndex, FoldT, "+", 0);
   function Prod is new fold (FoldElem, FoldIndex, FoldT, "*", 1);

   -- Map Demo
   type t1 is array (Integer range <>) of Integer;
   type t2 is array (Integer range <>) of Float;
   function square (x : Integer) return Float is
   begin
      return Float (x * x);
   end square;
   function my_map is new Map (Integer, Float, Integer, t1, t2, square);
   a : t1 (1 .. 5) := (1, 2, 3, 4, 5);
   b : t2 (a'Range);

   -- Max Demo
   --  function I_Max is new Maximum (Integer, "<");
   --  function I_Min is new Maximum (Integer, ">");
   function F_Max is new Maximum (Float);

   -- Search Demo
   type SearchT is array (Integer range <>) of Integer;
   function is_negative (b : Integer) return Boolean is
   begin
      return b < 0;
   end is_negative;

   procedure my_search is new Search
     (Elem => Integer, Index => Integer, TArray => SearchT,
      Prop => is_negative);
   array_to_search : SearchT (1 .. 5) := (1, -20, -69, 100, 102);
   search_flag     : Boolean;
   indexFound      : Integer;

   --Sort Demo
   type SortArray is array (Character range <>) of Float;
   procedure Sort_incr is new Sort (Float, Character, SortArray);
   procedure Sort_decr is new Sort (Float, Character, SortArray,">");

   SortArrayDemo : SortArray := (3.0, 6.2, 1.7, 5.2, 3.9);

begin
   Put_Line (">>>>>>>>>>>>Fold Demo>>>>>>>>>>>>>>>>");
   Put_Line (FoldElem'Image (Sum (T => (3, 2, 5, 7, 1))));
   Put_Line (FoldElem'Image (Prod (T => (3, 2, 5, 7, 1))));
   Put_Line ("<<<<<<<<<<<<<<Fold End<<<<<<<<<<<<<<");

   Put_Line (">>>>>>>>>>>>Map Demo>>>>>>>>>>>>>>>>");
   b := my_map (a);
   for i in b'Range loop
      Put_Line (Float'Image (b (i)));
   end loop;
   Put_Line ("<<<<<<<<<<<<<<Map End<<<<<<<<<<<<<<");

   Put_Line (">>>>>>>>>>>>Max-Min  Demo>>>>>>>>>>>>>>>>");
   Put_line (Float'Image (F_Max (3.0, 28.0)));
   --  Put_line (Integer'Image (I_Max (3, 28)));
   Put_Line ("<<<<<<<<<<<<<<Max-Min End<<<<<<<<<<<<<<");

   Put_Line (">>>>>>>>>>>>Search Demo>>>>>>>>>>>>>>>>");
   my_search (array_to_search, search_flag, indexFound);
   if search_flag then
      Put_Line (Integer'Image (indexFound));
   else
      Put_Line ("No negatives found!");
   end if;
   Put_Line ("<<<<<<<<<<<<<<Search End<<<<<<<<<<<<<<");
   Put_Line ("<<<<<<<<<<<<<<Sort Incr Demo<<<<<<<<<<<<<<");
   Sort_incr (SortArrayDemo);
   for i in SortArrayDemo'Range loop
      Put_Line (Float'Image (SortArrayDemo (i)));
   end loop;
   Put_Line ("<<<<<<<<<<<<<<Sort Decr Demo<<<<<<<<<<<<<<");
   Sort_decr (SortArrayDemo);
   for i in SortArrayDemo'Range loop
      Put_Line (Float'Image (SortArrayDemo (i)));
   end loop;
   Put_Line ("<<<<<<<<<<<<<<Sort End<<<<<<<<<<<<<<");

end Main;
