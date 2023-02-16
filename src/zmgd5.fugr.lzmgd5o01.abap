*----------------------------------------------------------------------*
***INCLUDE LZMGD5O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module MODIFY_SCREEN OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE modify_screen OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.

 IF sy-tcode = 'MM03'.
   LOOP AT SCREEN.
     IF screen-group1 = 'G1'.
       screen-input = 0.
       MODIFY SCREEN.
     ENDIF.
   ENDLOOP.
   ELSEIF sy-tcode = 'MM01' & 'MM02'.
     LOOP AT SCREEN.
     IF screen-group1 = 'G1'.
       screen-active = 1.
       MODIFY SCREEN.
     ENDIF.
   ENDLOOP.
     ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module GET_DATA OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE get_data OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.

  CALL FUNCTION 'MARA_GET_SUB'
   IMPORTING
     WMARA         = MARA
     XMARA         = *MARA
     YMARA         = LMARA.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  MODIFY_SCREEN  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE modify_screen INPUT.

DATA: LV_ID  TYPE MARA-MAT_ID.
LV_ID = MARA-MAT_ID.

CALL FUNCTION 'MARA_GET_SUB'
 IMPORTING
   WMARA         = MARA
   XMARA         = *MARA
   YMARA         = LMARA.
MARA-MAT_ID = LV_ID.

CALL FUNCTION 'MARA_SET_SUB'
  EXPORTING
    wmara         = MARA.




ENDMODULE.
