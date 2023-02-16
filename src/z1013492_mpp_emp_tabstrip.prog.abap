*&---------------------------------------------------------------------*
*& Report Z1013492_MPP_EMP_TABSTRIP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MPP_EMP_TABSTRIP.

CONTROLS TABSTR TYPE TABSTRIP.

TYPES:
"Structure for Holding the Employee Details.
      BEGIN OF ty_z1013492_emp_det,
        employee_no       TYPE z1013492_emp_det-employee_no,
        employee_name     TYPE z1013492_emp_det-employee_name,
        date_of_joining   TYPE z1013492_emp_det-date_of_joining,
        designation       TYPE z1013492_emp_det-designation,
        department        TYPE z1013492_emp_det-department,
        reporting_manager TYPE z1013492_emp_det-reporting_manager,
        salary            TYPE z1013492_emp_det-salary,
        door_no           TYPE z1013492_emp_det-door_no,
        contact_no        TYPE z1013492_emp_det-contact_no,
        blood_group       TYPE z1013492_emp_det-blood_group,
        created_on        TYPE z1013492_emp_det-created_on,
        street_name       TYPE z1013492_emp_det-street_name,
        city              TYPE z1013492_emp_det-city,
        pincode           TYPE z1013492_emp_det-pincode,
        dob               TYPE z1013492_emp_det-dob,
        title             TYPE z1013492_emp_det-title,
        gender            TYPE z1013492_emp_det-gender,
      END OF ty_z1013492_emp_det.

DATA:
 "Internal Table for Holding the ty_z1013492_emp_det
      it_emp TYPE TABLE OF ty_z1013492_emp_det,
 "Work Area for Holding the ty_z1013492_emp_det
      wa_emp TYPE ty_z1013492_emp_det.

SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
  PARAMETERS :
  "Varaible to Hold the Employee no
              p_emp_id TYPE z1013492_emp_det-employee_no.
SELECTION-SCREEN END OF SCREEN 50.

CALL SCREEN: 999,
             101,
             102,
             103.

*&---------------------------------------------------------------------*
*& Module STATUS_0999 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0999 OUTPUT.
 SET PF-STATUS 'Z1013492_PF'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0999  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0999 INPUT.

CASE SY-UCOMM.
  WHEN 'E1' or 'CANCEL' OR 'BACK'.
    LEAVE PROGRAM.
  WHEN 'T1'.
    tabstr-activetab = 'T1'.
  WHEN 'T2'.
    tabstr-activetab = 'T2'.
  WHEN 'T3'.
    tabstr-activetab = 'T3'.
  WHEN 'FD1'.
    PERFORM get_emp.
ENDCASE.                               "Case sy-ucomm...

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_emp
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_emp .

  SELECT SINGLE employee_no
                employee_name
                date_of_joining
                designation
                department
                reporting_manager
                salary
                door_no
                contact_no
                blood_group
                created_on
                street_name
                city
                pincode
                dob
                title
                gender
           FROM z1013492_emp_det
           INTO wa_emp
          WHERE employee_no = p_emp_id.

ENDFORM.
