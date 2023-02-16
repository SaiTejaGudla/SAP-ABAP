*&---------------------------------------------------------------------*
*& Report Z1013492_MPP_EMP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MPP_EMP.

TABLES: z1013492_emp_det.
TYPE-POOLS: VRM.

CALL SCREEN 100.


DATA: g_flag TYPE i,
      V_EMPLOYEE_ID  TYPE z1013492_emp_det-EMPLOYEE_NO,
      gv_id TYPE vrm_id,
      IT_VAL TYPE VRM_VALUES,
      WA_VAL LIKE LINE OF IT_VAL.

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS 'FETCH'.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'F2' OR 'CANCEL' OR 'BACK' .
      LEAVE PROGRAM.

    WHEN 'F1'.
      CLEAR Z1013492_EMP_DET.
      PERFORM GET_EMP.
        CALL SCREEN 200.
     ENDCASE.



ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'FETCH'.
* SET TITLEBAR 'xxx'.
ENDMODULE.

*&---------------------------------------------------------------------*
*& Form GET_EMP
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_emp .

      PERFORM GET_LIST.

 SELECT SINGLE *
     FROM Z1013492_emp_det
     INTO z1013492_emp_det
    WHERE employee_no = V_EMPLOYEE_ID.


   IF sy-subrc <> 0 AND V_EMPLOYEE_ID IS INITIAL .

     MESSAGE 'Invalid Data' TYPE 'I'.

   ENDIF.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form GET_LIST
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_list .


  wa_VAL-KEY = 'K1'.
  wa_VAL-TEXT = 'MR'.
  APPEND wa_VAL TO it_VAL.
  CLEAR wa_VAL.


  wa_VAL-KEY = 'K2'.
  wa_VAL-TEXT = 'MRS.'.
  APPEND wa_VAL TO it_VAL.
  CLEAR wa_VAL.


  wa_VAL-KEY = 'K3'.
  wa_VAL-TEXT = 'MISS.'.
  APPEND wa_VAL TO it_VAL.
  CLEAR wa_VAL.

 GV_ID = 'L1'.

  CALL FUNCTION 'VRM_SET_VALUES'
   EXPORTING
     id                    = GV_ID
     values                = IT_VAL
*  EXCEPTIONS
*    ID_ILLEGAL_NAME       = 1
*    OTHERS                = 2
           .

 IF sy-subrc <> 0.
* Implement suitable error handling here
 ENDIF.
REFRESH it_VAL.

ENDFORM.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.


  CASE sy-ucomm.
    WHEN 'CANCEL' OR 'BACK' OR 'SF5'.
      LEAVE TO SCREEN 100.
    WHEN 'I'.
      INSERT Z1013492_EMP_DET FROM Z1013492_EMP_DET.
      IF sy-subrc = 0.
      MESSAGE 'Data Inserted Successfully' TYPE 'S'.
      ENDIF.
    WHEN 'U'.
      UPDATE z1013492_emp_det FROM z1013492_emp_det.
      IF sy-subrc = 0 .
         MESSAGE 'Data Updated Successfully' TYPE 'S'.
      ENDIF.
    WHEN 'MD'.
      MODIFY z1013492_emp_det FROM z1013492_emp_det.
      IF sy-subrc = 0.
          MESSAGE 'Data Modify Successfully' TYPE 'S'.
      ENDIF.
    WHEN 'DEL'.
      DELETE FROM z1013492_emp_det WHERE employee_no = z1013492_emp_det-employee_no.
      IF sy-subrc = 0.
      MESSAGE 'Data Deleted Successfully' TYPE 'S'.
      ENDIF.
  ENDCASE.

ENDMODULE.
