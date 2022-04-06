with student;     use student;
with Ada.Text_IO; use Ada.Text_IO;
package body class is
   --  procedure Add_Student_Grade (C : in out Class_Type; S : in Student_Grades)
   --  is
   --  begin
   --     if not isFull (C => C) then
   --        C.Student_Arr (C.Pointer) := S;
   --        C.Pointer                 := C.Pointer + 1;
   --     end if;
   --  end Add_Student_Grade;

   function isFull (C : Class_Type) return Boolean is
   begin
      return C.Pointer > 5;
   end isFull;
   function Class_Average (C : Class_Type) return Float is
      sum : Float := 0.0;
   begin
      for i in C.Student_Arr'First .. C.Student_Arr'Last loop
         sum := sum + Grade_Average (C.Student_Arr (i));
      end loop;
      return sum / 5.0;
   end Class_Average;
   function Did_Everyone_Get_Grade (C : Class_Type) return Boolean is
   begin
      for i in C.Student_Arr'First .. C.Student_Arr'Last loop
         if not Do_All_Grades_Written (C.Student_Arr (i)) then
            return False;
         end if;
      end loop;
      return True;
   end Did_Everyone_Get_Grade;
   function Did_Everyone_Pass (C : Class_Type) return Boolean is
   begin
      for i in C.Student_Arr'First .. C.Student_Arr'Last loop
         if not Does_Student_Pass_All_Subjects (C.Student_Arr (i)) then
            return False;
         end if;
      end loop;
      return True;
   end Did_Everyone_Pass;
   function Get_Grade
     (C : Class_Type; N : Natural; S : Subject_Names) return Grade_Range
   is
   begin
      return Grade_of_Subject (C.Student_Arr (N), S);
   end Get_Grade;
   procedure Print_Class (C : Class_Type) is
   begin
      Put_Line ("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      Put_Line ("Class" & Id'Image (C.Name));
      for i in C.Student_Arr'First .. C.Student_Arr'Last loop
         Put_Line ("Student #" & Integer'Image (i) & " Grades");
         Print_Grades (C.Student_Arr (i));
      end loop;
      Put_Line ("Class avg: " & Float'Image (Class_Average (C)));
      Put_Line
        ("Did everyone pass ? " & Boolean'Image (Did_Everyone_Pass (C)));
      Put_Line
        ("Did everyone get a grade ? " &
         Boolean'Image (Did_Everyone_Get_Grade (C)));
      Put_Line ("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
   end Print_Class;

   procedure Compare (C1 : in Class_Type; C2 : in Class_Type) is
   begin
      if Class_Average (C1) > Class_Average (C2) then
         Put_Line ("Class " & Id'Image (C1.Name) & " has higher average"& Float'Image(Class_Average(C2)));
      elsif Class_Average (C1) < Class_Average (C2) then
         Put_Line ("Class " & Id'Image (C2.Name) & "  has higher average" & Float'Image(Class_Average(C2)));
      else
         Put_Line
           (Id'Image (C1.Name) & " & " & Id'Image (C2.Name) &
            " have the same average " & Float'Image(Class_Average(C2)));
      end if;
   end Compare;
   procedure End_Semester (C : in out Class_Type) is
   begin
      for i in C.Student_Arr'First .. C.Student_Arr'Last loop
         End_Semester_For_Student (C.Student_Arr (i));
      end loop;
   end End_Semester;
   procedure Change_Grade
     (C : in out Class_Type; N : Natural; S : Subject_Names; GR : Grade_Range)
   is
   begin
      Set_Grade (G => C.Student_Arr (N), S => S, GR => GR);
   end Change_Grade;
   procedure For_Each (C : in out Class_Type) is
   begin
      for i in C.Student_Arr'First .. C.Student_Arr'Last loop
         Operation (C.Student_Arr (i));
      end loop;
   end For_Each;
end class;
