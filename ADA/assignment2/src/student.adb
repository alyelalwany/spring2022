with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
package body student is

   function Grade_of_Subject
     (G : Student_Grades; S : Subject_Names) return Grade_Range
   is
   begin
      return G.Arr (S);
   end Grade_of_Subject;

   function Do_All_Grades_Written (G : Student_Grades) return Boolean is
   begin
      for Subject_Name in G.Arr'First .. G.Arr'Last loop
         if G.Arr (Subject_Name) = NOT_WRITTEN then
            return False;
         end if;
      end loop;
      return True;
   end Do_All_Grades_Written;

   function Does_Student_Pass_All_Subjects (G : Student_Grades) return Boolean
   is
   begin
      for Subject_Name in G.Arr'First .. G.Arr'Last loop
         if G.Arr (Subject_Name) = NOT_WRITTEN or G.Arr (Subject_Name) = FAIL
         then
            return False;
         end if;
      end loop;
      return True;
   end Does_Student_Pass_All_Subjects;
   function Grade_Average (G : Student_Grades) return Float is
      Grade : Float := 0.0;
   begin
      for Subject_Name in G.Arr'First .. G.Arr'Last loop
         case G.Arr (Subject_Name) is
            when FAIL =>
               Grade := Grade + 1.0;
            when PASS =>
               Grade := Grade + 2.0;
            when SATISFACTORY =>
               Grade := Grade + 3.0;
            when GOOD =>
               Grade := Grade + 4.0;
            when EXCELLENT =>
               Grade := Grade + 5.0;
            when others => -- NOT_WRITTEN
               Grade := Grade + 0.0;
               exit;
         end case;
      end loop;
      return Grade / 5.0;
   end Grade_Average;

   procedure Set_Grade
     (G : in out Student_Grades; S : Subject_Names; GR : Grade_Range)
   is
   begin
      G.Arr (S) := GR;
   end Set_Grade;
   procedure Print_Grades (G : Student_Grades) is
   begin
      for Subject_Name in G.Arr'First .. G.Arr'Last loop
         Put_Line
           ("Grade for " & Subject_Names'Image (Subject_Name) & " is " &
            Grade_Range'Image (G.Arr (Subject_Name)));
      end loop;
   end Print_Grades;

   procedure Put_Grade_To_All_Subjects
     (G : in out Student_Grades; GR : Grade_Range)
   is
   begin
      for Subject_Name in G.Arr'First .. G.Arr'Last loop
         G.Arr (Subject_Name) := GR;
      end loop;
   end Put_Grade_To_All_Subjects;

   procedure End_Semester_For_Student (C : in out Student_Grades) is
      subtype RandomGrade is  Grade_Range range FAIL .. EXCELLENT;
      package random_grade is new Ada.Numerics.Discrete_Random (RandomGrade);
      G : random_grade.Generator;
   begin
      random_grade.Reset (G);
      for Subject_Name in C.Arr'First .. C.Arr'Last loop
         if C.Arr (Subject_Name) = NOT_WRITTEN then
            C.Arr (Subject_Name) := random_grade.random (G);
         end if;
      end loop;
   end End_Semester_For_Student;

end student;
