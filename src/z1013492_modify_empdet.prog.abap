*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_16
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MODIFY_EMPDET.

PARAMETERS:
"Varaibles for RadioButton
               p_Add RADIOBUTTON GROUP Rad1,
            p_Delete RADIOBUTTON GROUP Rad1,
            p_Modify RADIOBUTTON GROUP Rad1,
"Variables for employee details
                   p_emp_no TYPE char6,
                   p_emp_nm TYPE char20,
                      p_DOJ TYPE dats,
                    p_desgn TYPE char15,
                     p_dept TYPE char6,
                     P_Mngr TYPE char20.

DATA:
"Internal table to store Employee Details
      it_emp TYPE TABLE OF Z1013492_ASG_EMP,
"Work Area to store Employee Details
      wa_emp TYPE Z1013492_ASG_EMP.

SELECT * FROM Z1013492_ASG_EMP
  INTO TABLE it_emp.


CASE 'X'.
  WHEN p_Add.
    wa_emp-EMPLOYEE_NO     = p_emp_no.
    wa_emp-EMPLOYEE_NAME   = p_emp_nm.
    wa_emp-DATE_OF_JOINING = p_DOJ.
    wa_emp-DESIGNATION     = p_desgn.
    wa_emp-DEPARTMENT      = p_dept.
  wa_emp-REPORTING_MANAGER = p_Mngr.
    INSERT z1013492_asg_emp from wa_emp.
  WHEN p_Delete.
    DELETE FROM z1013492_asg_emp WHERE Employee_NO = p_emp_no.
  WHEN P_Modify.
    wa_emp-EMPLOYEE_NO     = p_emp_no.
    wa_emp-EMPLOYEE_NAME   = p_emp_nm.
    wa_emp-DATE_OF_JOINING = p_DOJ.
    wa_emp-DESIGNATION     = p_desgn.
    wa_emp-DEPARTMENT      = p_dept.
  wa_emp-REPORTING_MANAGER = p_Mngr.
   MODIFY z1013492_asg_emp FROM wa_emp.
ENDCASE.

LOOP AT it_emp INTO wa_emp.
  WRITE:/ wa_emp-EMPLOYEE_NO,
          wa_emp-EMPLOYEE_NAME,
          wa_emp-DATE_OF_JOINING,
          wa_emp-DESIGNATION,
          wa_emp-DEPARTMENT,
          wa_emp-REPORTING_MANAGER.
ENDLOOP.                               "Case'X'...
