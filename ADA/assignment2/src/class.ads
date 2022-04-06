with student; use student;
with subject; use subject;
generic 
     type Id is (<>);
   with function "<"(a,b : Id) return Boolean is <>;
package class is
   type Class_Type(Name : Id) is limited private;
   
   function Class_Average(C : Class_Type) return Float; -- calculate the class average based on sum of each individual divided by 5 (Number of the students in each class)
   function Did_Everyone_Get_Grade(C : Class_Type) return Boolean; -- check whether Do_All_Grades_Written() function is true for every student
   function Did_Everyone_Pass(C : Class_Type) return Boolean; -- check whether Does_Student_Pass_All_Subjects() function is true for every student
   function Get_Grade(C : Class_Type; N : Natural; S : Subject_Names) return Grade_Range; -- return grade of th `S` subject for `N`th index in class `C`
   procedure Print_Class(C : Class_Type); -- Print data of the all students.
   procedure Compare(C1 : in Class_Type; C2 : in Class_Type); -- compare the classes based on their Class_Average.
   procedure End_Semester(C : in out Class_Type); -- assign random grades(Other than NOT_WRITTEN) to all grades of the students.
   procedure Change_Grade(C : in out Class_Type; N : Natural; S : Subject_Names; GR : Grade_Range); -- change grade for student with index `N` with grade `GR` in subject `S`
   --  procedure Add_Student_Grade(C : in out Class_Type;S  : in Student_Grades);
   function isFull(C: Class_Type) return Boolean;

   generic 
      with procedure Operation(S: in out Student_Grades);
   procedure For_Each(C: in out Class_Type);
private
   type StudentArray is array (Natural range <>) of Student_Grades;
   type Class_Type(Name : Id) is record 
      Student_Arr: StudentArray(1..5);
      Pointer: Natural := 1;
   end record;
   
end class;
