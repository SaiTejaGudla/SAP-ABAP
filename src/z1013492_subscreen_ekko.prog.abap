*&---------------------------------------------------------------------*
*& Report Z1013492_SUBSCREEN_EKKO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_SUBSCREEN_EKKO.

TABLES: ekko.
DATA: g_ebeln TYPE ekko-ebeln.

CALL SCREEN 100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS 'FETCH'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'F1'.
      IF g_ebeln is NOT INITIAL.
         CALL SCREEN 200 STARTING AT 10 50 ENDING AT 400 800.
      ELSEIF g_ebeln IS INITIAL.
        MESSAGE 'Data Not Found' TYPE 'I'.
      ENDIF.
    WHEN 'E1' OR 'CANCEL' OR 'BACK'.
      LEAVE PROGRAM.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'FETCH'.

  SELECT SINGLE bukrs
                bstyp
                bsart
                aedat
                ernam
           FROM ekko
           INTO CORRESPONDING FIELDS OF ekko
          WHERE ebeln = g_ebeln.

 ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  CASE sy-ucomm.
    WHEN 'E2' OR 'CANCEL' OR 'BACK'.
      LEAVE TO SCREEN 100.
  ENDCASE.

ENDMODULE.
