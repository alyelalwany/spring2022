with class;
with Ada.Text_IO; use Ada.Text_IO;
with student;     use student;
with subject;     use subject;
procedure Main is
   package classDemo is new class (Id => Integer, "<" => "<");
   procedure set_excellent (S : in out Student_Grades) is
   begin
      Put_Grade_To_All_Subjects (G => S, GR => subject.EXCELLENT);
   end set_excellent;

   procedure set_each_excellent is new classDemo.For_Each (set_excellent);
   student1  : Student_Grades;
   student2  : Student_Grades;
   student3  : Student_Grades;
   student4  : Student_Grades;
   student5  : Student_Grades;
   student6  : Student_Grades;
   student7  : Student_Grades;
   student8  : Student_Grades;
   student9  : Student_Grades;
   student10 : Student_Grades;
   student11 : Student_Grades;
   student12 : Student_Grades;
   student13 : Student_Grades;
   student14 : Student_Grades;
   student15 : Student_Grades;
   class1    : classDemo.Class_Type (1);
   class2    : classDemo.Class_Type (2);
   class3    : classDemo.Class_Type (3);
   type StudentArray is array (Integer range <>) of Student_Grades;
   students : StudentArray (1 .. 15);
begin

   -- Check if Grades are NOT_WRITTEN
   classDemo.Print_Class (class1);
   classDemo.Print_Class (class2);
   classDemo.Print_Class (class3);

   -- Initialization
   Set_Grade (student1, C, EXCELLENT);
   Set_Grade (student1, JAVA, GOOD);
   Set_Grade (student1, Python, SATISFACTORY);
   Set_Grade (student1, CPP, EXCELLENT);

   Set_Grade (student2, C, EXCELLENT);
   Set_Grade (student2, JAVA, GOOD);
   Set_Grade (student2, Python, PASS);
   Set_Grade (student2, CPP, GOOD);
   Set_Grade (student2, subject.ADA, subject.GOOD);

   Set_Grade (student3, C, SATISFACTORY);
   Set_Grade (student3, JAVA, SATISFACTORY);
   Set_Grade (student3, Python, SATISFACTORY);
   Set_Grade (student3, CPP, SATISFACTORY);
   Set_Grade (student2, subject.ADA, subject.SATISFACTORY);

   Set_Grade (student4, C, GOOD);
   Set_Grade (student4, JAVA, PASS);
   Set_Grade (student4, Python, EXCELLENT);
   Set_Grade (student4, CPP, PASS);
   Set_Grade (student4, subject.ADA, GOOD);

   Set_Grade (student5, C, EXCELLENT);
   Set_Grade (student5, JAVA, PASS);
   Set_Grade (student5, Python, EXCELLENT);
   Set_Grade (student5, CPP, PASS);
   Set_Grade (student5, subject.ADA, EXCELLENT);

   Set_Grade (student6, C, EXCELLENT);
   Set_Grade (student6, JAVA, GOOD);
   Set_Grade (student6, Python, GOOD);
   Set_Grade (student6, CPP, EXCELLENT);
   Set_Grade (student6, subject.ADA, GOOD);

   Set_Grade (student7, C, PASS);
   Set_Grade (student7, JAVA, GOOD);
   Set_Grade (student7, Python, EXCELLENT);
   Set_Grade (student7, CPP, PASS);
   Set_Grade (student7, subject.ADA, PASS);

   Set_Grade (student8, C, PASS);
   Set_Grade (student8, JAVA, EXCELLENT);
   Set_Grade (student8, Python, NOT_WRITTEN);
   Set_Grade (student8, CPP, PASS);
   Set_Grade (student8, subject.ADA, PASS);

   Set_Grade (student9, C, FAIL);
   Set_Grade (student9, JAVA, NOT_WRITTEN);
   Set_Grade (student9, Python, PASS);
   Set_Grade (student9, CPP, EXCELLENT);
   Set_Grade (student9, subject.ADA, FAIL);

   Set_Grade (student10, C, PASS);
   Set_Grade (student10, JAVA, EXCELLENT);
   Set_Grade (student10, Python, PASS);
   Set_Grade (student10, CPP, EXCELLENT);

   Set_Grade (student11, C, PASS);
   Set_Grade (student11, JAVA, EXCELLENT);
   Set_Grade (student11, Python, PASS);
   Set_Grade (student11, CPP, EXCELLENT);

   Set_Grade (student12, C, PASS);
   Set_Grade (student12, JAVA, EXCELLENT);
   Set_Grade (student12, Python, PASS);
   Set_Grade (student12, CPP, EXCELLENT);

   Set_Grade (student13, C, PASS);
   Set_Grade (student13, JAVA, EXCELLENT);
   Set_Grade (student13, Python, PASS);
   Set_Grade (student13, CPP, EXCELLENT);

   Set_Grade (student14, C, PASS);
   Set_Grade (student14, JAVA, EXCELLENT);
   Set_Grade (student14, Python, PASS);
   Set_Grade (student14, CPP, EXCELLENT);

   Set_Grade (student15, C, PASS);
   Set_Grade (student15, JAVA, EXCELLENT);
   Set_Grade (student15, Python, PASS);
   Set_Grade (student15, CPP, EXCELLENT);

   --putting the students in a container.
   students (1)  := student1;
   students (2)  := student2;
   students (3)  := student3;
   students (4)  := student4;
   students (5)  := student5;
   students (6)  := student6;
   students (7)  := student7;
   students (8)  := student8;
   students (9)  := student9;
   students (10) := student10;
   students (11) := student11;
   students (12) := student12;
   students (13) := student13;
   students (14) := student14;
   students (15) := student15;
   --Testing the functions from student package.
   for i in 1 .. 10 loop
      Put_Line (">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      Put_Line
        ("Student #" & Integer'Image (i) & " Grades before processing :- ");
      Print_Grades (students (i));
      if not Do_All_Grades_Written (students (i)) then
         Put_Line ("Student has not all grades written");
         Put_Line ("Ending semester for student...");
         End_Semester_For_Student (students (i));

      end if;
      if not Does_Student_Pass_All_Subjects (students (i)) then
         Put_Line ("Student has not passed all subjects");
         Put_Line ("Putting FAIL for all subjects for student...");
         Put_Grade_To_All_Subjects (students (i), subject.FAIL);

      end if;
      Put_Line
        ("Student #" & Integer'Image (i) & " Grades after processing :- ");
      Print_Grades (students (i));
      Put_Line
        ("Student #" & Integer'Image (i) & " has avg : " &
         Float'Image (Grade_Average (G => students (i))));
      Put_Line (">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
   end loop;

   --Testing getting grade
   Put_Line ("Check if everyone got  grade");
   Put_Line (Boolean'Image (classDemo.Did_Everyone_Get_Grade (class1)));
   Put_Line (Boolean'Image (classDemo.Did_Everyone_Get_Grade (class2)));
   Put_Line (Boolean'Image (classDemo.Did_Everyone_Get_Grade (class3)));

   --Testing passing
   Put_Line ("Check if everyone passed : ");
   Put_Line (Boolean'Image (classDemo.Did_Everyone_Pass (class1)));
   Put_Line (Boolean'Image (classDemo.Did_Everyone_Pass (class2)));
   Put_Line (Boolean'Image (classDemo.Did_Everyone_Pass (class3)));

   -- Testing changing grade in class and check if everyone got grade
   Put_Line ("Printing class2 before ending the semester");
   classDemo.Print_Class (class2);
   Put_Line ("Ending semester and checking if everyone got grade : ");
   Put_Line (Boolean'Image (classDemo.Did_Everyone_Get_Grade (class2)));
   classDemo.End_Semester (class2);
   Put_Line (Boolean'Image (classDemo.Did_Everyone_Get_Grade (class2)));
   Put_Line ("Printing class2 after ending the semester");
   classDemo.Print_Class (class2);

   -- Testing the for each function with printing class
   Put_Line ("Giving all students excellent in class2 : ");
   classDemo.Compare (class1, class2);
   set_each_excellent (class2);
   classDemo.Print_Class (class2);

   --Testing end semester from class package
   Put_Line ("Check semester end for class1 : ");
   classDemo.End_Semester (class1);
   classDemo.Print_Class (class1);

   --Comparing the classes
   Put_Line
     ("Give all students excellent in class1 and compare with class2 : ");
   classDemo.Compare (class1, class2);
   set_each_excellent (class1);
   classDemo.Compare (class1, class2);

   -- Testing print
   classDemo.Print_Class (class1);
   classDemo.Print_Class (class2);
   classDemo.End_Semester (class3);
   classDemo.Print_Class (class3);
end Main;
