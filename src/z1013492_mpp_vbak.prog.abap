*&---------------------------------------------------------------------*
*& Report Z1013492_MPP_VBAK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_mpp_vbak.

TABLES: vbak.
DATA: g_flag TYPE i.

CALL SCREEN 100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'FETCH'.

  IF g_flag = 0.
    PERFORM invisible.
  ELSEIF g_flag = 1.
    PERFORM visible.
  ENDIF.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN 'EXIT' OR 'CANCEL' OR 'BACK'.
*      LEAVE TO SCREEN 0.
      LEAVE PROGRAM.
    WHEN 'GET'.
      SELECT SINGLE vbeln
                    erdat
                    erzet
                    ernam
                    angdt
                    bnddt
                    auart
               FROM vbak INTO CORRESPONDING FIELDS OF vbak
              WHERE vbeln = vbak-vbeln.
      IF sy-subrc = 0 .
        g_flag = 1.
      ENDIF.


  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form invisible
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM invisible .

  LOOP AT SCREEN.
    IF screen-name = 'VBAK-ERDAT' OR
       screen-name = 'VBAK-ERZET' OR
       screen-name = 'VBAK-ERNAM' OR
       screen-name = 'VBAK-ANGDT' OR
       screen-name = 'VBAK-BNDDT' OR
       screen-name = 'VBAK-AUART'.
      screen-active = 0.

      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form visible
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM visible .

  LOOP AT SCREEN.

    IF screen-name = 'VBAK-ERDAT' OR
       screen-name = 'VBAK-ERZET' OR
       screen-name = 'VBAK-ERNAM' OR
       screen-name = 'VBAK-ANGDT' OR
       screen-name = 'VBAK-BNDDT' OR
       screen-name = 'VBAK-AUART'.
       screen-active = 1.
       screen-input  = 0.

      MODIFY SCREEN.

    ELSEIF screen-name = 'VBAK-VBELN'.
      screen-input = 0.
      screen-active = 1.
      MODIFY SCREEN.

    ENDIF.
  ENDLOOP.

ENDFORM.
