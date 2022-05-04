with Ada.Text_IO, Ada.Numerics.Discrete_Random, Ada.Numerics.Float_Random, Ada
  .Calendar;
use Ada.Text_IO, Ada.Calendar;

procedure Main is

   subtype ShipNr is Integer range 1 .. 20;

   type ShipNr_Access is access ShipNr;
   type Duration_Access is access Duration;

   subtype PostNr is Integer range 1 .. 3;
   type PostsArray is array (PostNr) of Boolean;

   package RandomPostGenerator is new Ada.Numerics.Discrete_Random (PostNr);

   protected Utils is
      procedure Print (S : in String := "");
      function getRandomPost return PostNr;
      function getRandomFloat (from : in Float; to : in Float) return Float;
   private
      Post_Generator  : RandomPostGenerator.Generator;
      Float_Generator : Ada.Numerics.Float_Random.Generator;
   end Utils;

   protected body Utils is
      procedure Print (S : in String := "") is
      begin
         Put_Line (S);
      end Print;
      function getRandomPost return PostNr is
         post_out : PostNr := 1;
      begin
         RandomPostGenerator.Reset (Post_Generator);
         post_out := RandomPostGenerator.Random (Post_Generator);
         return post_out;
      end getRandomPost;

      function getRandomFloat (from : in Float; to : in Float) return Float is
         float_out : Float := 0.0;
      begin
         Ada.Numerics.Float_Random.Reset (Float_Generator);
         float_out :=
           (Ada.Numerics.Float_Random.Random (Float_Generator) * (to - from) +
            from);
         return float_out;
      end getRandomFloat;
   end Utils;

   protected port is

      entry arrive (ship_at_port : in ShipNr);
      entry loadUp
        (name           : in ShipNr; post : in out Integer;
         loadUpDuration : in Duration);
   private
      -- An empty port is false.
      Posts        : PostsArray := (False, False, False);
      current_post : PostNr     := 1;
   end port;

   protected body Port is

      entry arrive (ship_at_port : in ShipNr) when True is
         more_than_one_empty : Boolean := False;
         search_index        : Integer := Posts'First;
      begin

         while Posts (search_index) and search_index <= Posts'Last loop
            search_index := search_index + 1;
         end loop;

         if search_index < Posts'Last then
            current_post := search_index; --store first empty
            search_index := search_index + 1;
            while search_index <= Posts'Last loop
               more_than_one_empty :=
                 more_than_one_empty or
                 not Posts
                   (search_index); -- check for more empty
               search_index := search_index + 1;

            end loop;

            if more_than_one_empty then
               current_post := Utils.getRandomPost;
               Utils.Print
                 ("Port: More than one empty post. Generating a random post for Ship # " &
                  ShipNr'Image (ship_at_port));
            else
               Utils.Print
                 ("Port: Only one empty post found - " &
                  PostNr'Image (current_post) & ". Giving it to Ship # " &
                  ShipNr'Image (ship_at_port));

            end if;
         else
            Utils.Print
              ("Port: No empty posts found for " &
               ShipNr'Image (ship_at_port));
         end if;
      end arrive;

      entry loadUp
        (name : in ShipNr; post : in out Integer; loadUpDuration : in Duration)
        when not Posts (current_post) is
      begin
         Posts (current_post) := True;
         post                 := current_post;
         Utils.Print
           ("Ship #" & ShipNr'Image (name) & " is loading for " &
              Duration'Image (loadUpDuration) & " seconds");
         --  delay (loadUpDuration);
         Utils.Print
           ("Ship #" & ShipNr'Image (name) & " has loaded at post" &
            PostNr'Image (current_post));
         Posts (current_post) := False;
      end loadUp;
   end Port;

   task type Ship (name : ShipNr_Access; loadUpDuration : Duration_Access);

   task body Ship is
      loaded        : Boolean := False;
      nr_of_tries   : Integer := 0;
      post_to_visit : Integer := Utils.getRandomPost;
   begin
      while not loaded and nr_of_tries < 3 loop
         Utils.Print
           ("Ship#" & ShipNr'Image (Ship.name.all) & ": try #" &
            Integer'Image (nr_of_tries + 1));
         select
            port.arrive (name.all);
            port.loadUp (name.all, post_to_visit, loadUpDuration.all);
            delay (loadUpDuration.all);
            loaded := True;
            Utils.Print
              ("Ship#" & ShipNr'Image (Ship.name.all) &
               ": Successful loading");
            Utils.Print
              ("Ship#" & ShipNr'Image (Ship.name.all) & ": going home..SAIL!");
         or
            delay 1.0;
         end select;
         nr_of_tries := nr_of_tries + 1;
      end loop;
      if not loaded then
         Utils.Print
           ("Ship#" & ShipNr'Image (Ship.name.all) &
            ": Unsuccessful loading. We're leaving for good!");
      end if;
   exception
      when Tasking_Error =>
         Put_Line ("Ship#" & ShipNr'Image (Ship.name.all) & " Failed");
   end Ship;

   type ship_access is access Ship;
   Ships     : array (1 .. 20) of ship_access;
   startTime : Float;

begin
   for I in Ships'Range loop
      startTime := Utils.getRandomFloat (0.1, 1.1);
      Utils.Print
        ("Ship # " & Integer'Image (I) & " arriving at  " &
         Float'Image (startTime));
      delay Duration (startTime);
      Ships (I) :=
        new Ship
          (new ShipNr'(I),
           new Duration'(Duration (Utils.getRandomFloat (2.0, 3.0))));
   end loop;
exception
   when Tasking_Error =>
      Put_Line ("Port Failed");
end Main;
