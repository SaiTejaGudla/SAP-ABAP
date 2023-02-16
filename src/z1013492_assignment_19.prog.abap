*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_19
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_assignment_19.

TYPES:
  "Structure to hold the Student Details
  BEGIN OF ty_stdetails,
    student_roll_no(5) TYPE n,
    student_name(20)   TYPE c,
    Theory_marks       TYPE i,
    Practical_marks    TYPE i,
  END OF ty_stdetails.

DATA:
  "Internal Table to Hold the Student Details
  it_tab1 TYPE TABLE OF ty_stdetails,
  "Work Table to Hold the Student Details
  wa_tab1 TYPE ty_stdetails.

TYPES:
  "Structure To hold the Grade Details
  BEGIN OF ty_marks,
    student_roll_no(5) TYPE n,
    student_name(20)   TYPE c,
    Grade              TYPE c,
  END OF ty_marks.

DATA:
  "Internal Table to Hold the Grade Details
  it_tab2 TYPE TABLE OF ty_marks,
  "Work area to Hold the Grade Details
  wa_tab2 TYPE ty_marks,
  "Variable to store the Final Result
  g_final TYPE i.

wa_tab1-student_roll_no = '51653'.
wa_tab1-student_name    = 'Sai Teja'.
wa_tab1-Theory_marks    = '40'.
wa_tab1-Practical_marks = '50'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51651'.
wa_tab1-student_name    = 'Tarun'.
wa_tab1-Theory_marks    = '35'.
wa_tab1-Practical_marks = '40'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51652'.
wa_tab1-student_name    = 'Prashnath'.
wa_tab1-Theory_marks    = '30'.
wa_tab1-Practical_marks = '30'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51654'.
wa_tab1-student_name    = 'Sandeep'.
wa_tab1-Theory_marks    = '25'.
wa_tab1-Practical_marks = '25'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51655'.
wa_tab1-student_name    = 'Dhavan'.
wa_tab1-Theory_marks    = '28'.
wa_tab1-Practical_marks = '43'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51656'.
wa_tab1-student_name    = 'Phani'.
wa_tab1-Theory_marks    = '34'.
wa_tab1-Practical_marks = '56'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51657'.
wa_tab1-student_name    = 'Venkat'.
wa_tab1-Theory_marks    = '27'.
wa_tab1-Practical_marks = '55'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51658'.
wa_tab1-student_name    = 'Berinath'.
wa_tab1-Theory_marks    = '22'.
wa_tab1-Practical_marks = '57'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51659'.
wa_tab1-student_name    = 'Fathima'.
wa_tab1-Theory_marks    = '34'.
wa_tab1-Practical_marks = '58'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51660'.
wa_tab1-student_name    = 'Sowmya'.
wa_tab1-Theory_marks    = '30'.
wa_tab1-Practical_marks = '50'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51661'.
wa_tab1-student_name    = 'Likitha'.
wa_tab1-Theory_marks    = '23'.
wa_tab1-Practical_marks = '56'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51662'.
wa_tab1-student_name    = 'Dileep'.
wa_tab1-Theory_marks    = '37'.
wa_tab1-Practical_marks = '45'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51663'.
wa_tab1-student_name    = 'Aditya'.
wa_tab1-Theory_marks    = '24'.
wa_tab1-Practical_marks = '53'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51664'.
wa_tab1-student_name    = 'Divakar'.
wa_tab1-Theory_marks    = '35'.
wa_tab1-Practical_marks = '45'.
APPEND wa_tab1 TO it_tab1.

wa_tab1-student_roll_no = '51665'.
wa_tab1-student_name    = 'RaVi'.
wa_tab1-Theory_marks    = '38'.
wa_tab1-Practical_marks = '48'.
APPEND wa_tab1 TO it_tab1.

LOOP AT it_tab1 INTO wa_tab1.
  g_final = wa_tab1-Theory_marks + wa_tab1-Practical_marks.

  IF g_final < 60.
    wa_tab2-student_roll_no = wa_tab1-student_roll_no.
    wa_tab2-student_name    = wa_tab1-student_name.
    wa_tab2-Grade = 'C'.
    APPEND wa_tab2 TO it_tab2.
  ELSEIF g_final < 70.
    wa_tab2-student_roll_no = wa_tab1-student_roll_no.
    wa_tab2-student_name    = wa_tab1-student_name.
    wa_tab2-Grade = 'B'.
    APPEND wa_tab2 TO it_tab2.
  ELSEIF g_final > 70.
    wa_tab2-student_roll_no = wa_tab1-student_roll_no.
    wa_tab2-student_name    = wa_tab1-student_name.
    wa_tab2-Grade = 'A'.
    APPEND wa_tab2 TO it_tab2.
  ENDIF.                               "Validating the Grade
ENDLOOP.                               "Loop at it_tab1...

WRITE sy-uline+0(42).

WRITE:/1 sy-vline,
       3 'Student Roll no',20 sy-vline,
       22 'Student Name', 35 sy-vline,
       36 'Grade', 42 sy-vline.
WRITE:/ sy-uline+0(42).

LOOP AT it_tab2 INTO wa_tab2.
  WRITE:/1 sy-vline,
         3 wa_tab2-Student_Roll_no,20 sy-vline,
         22 wa_tab2-Student_Name, 35 sy-vline,
         36 wa_tab2-Grade, 42 sy-vline.
  WRITE:/ sy-uline+0(42).
ENDLOOP.                               "Loop at it_tab2...
