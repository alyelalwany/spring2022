with subject; use subject;
package student is

   type Student_Grades is private;
   
   function Grade_of_Subject(G : Student_Grades; S : Subject_Names) return Grade_Range; -- return Grade of the given `Subject` parameter
   function Do_All_Grades_Written(G : Student_Grades) return Boolean; -- check whether all of the grades are between FAIL and EXCELLENT
   function Does_Student_Pass_All_Subjects(G : Student_Grades) return Boolean; -- check whether all of the subject's grades are at least PASS.
   function Grade_Average(G : Student_Grades) return Float; -- calculate grade average based on numbers below, by summing all and dividing by subject count which is 5.

   -- NOT_WRITTEN => 0.0, FAIL => 1.0, PASS => 2.0, SATISFACTORY => 3.0, GOOD => 4.0, EXCELLENT => 5.0
   procedure Set_Grade (G : in out Student_Grades; S : Subject_Names; GR : Grade_Range); -- assign grade `GR` to the subject `S`
   procedure Print_Grades(G : Student_Grades); -- Print all grades with subjects.
   procedure Put_Grade_To_All_Subjects(G : in out Student_Grades; GR : Grade_Range); -- assign `GR` grade to every subject.
   procedure End_Semester_For_Student(C : in out Student_Grades); -- write random grade for every subject where grade is NOT_WRITTEN. Example for Random Generator is below:
   
private
   type TArray is array (Subject_Names range <>) of Grade_Range;
   type Student_Grades is record
      Arr: TArray(CPP..ADA) := (others=>NOT_WRITTEN);
      
   end record;


end student;
