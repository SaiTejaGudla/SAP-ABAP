*&---------------------------------------------------------------------*
*& Report Z1013492_MPP_VBAK_VBAP_INTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MPP_VBAK_VBAP_INTER.

TABLES: vbak, vbap.

CONTROLS TC1 TYPE TABLEVIEW USING SCREEN 100.
CONTROLS TC2 TYPE TABLEVIEW USING SCREEN 200.

TYPES: BEGIN OF ty_vbak,
        vbeln TYPE vbak-vbeln,
        erdat TYPE vbak-erdat,
        erzet TYPE vbak-erzet,
        ernam TYPE vbak-ernam,
        audat TYPE vbak-audat,
       END OF ty_vbak,

       BEGIN OF ty_vbap,
         vbeln TYPE vbap-vbeln,
         posnr TYPE vbap-posnr,
         matnr TYPE vbap-matnr,
         pstyv TYPE vbap-pstyv,
         posar TYPE vbap-posar,
       END OF ty_vbap.

DATA: it_vbak TYPE TABLE of ty_vbak,
      it_vbap TYPE TABLE OF ty_vbap,
      wa_vbap TYPE ty_vbap,
      wa_vbak TYPE ty_vbak,
      g_vbeln TYPE vbak-vbeln,
      g_value TYPE vbak-vbeln,
      g_field TYPE vbak-vbeln.

SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
  SELECT-OPTIONS: S_VBELN FOR g_vbeln.
SELECTION-SCREEN END OF SCREEN 50.

CALL SCREEN 100.

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS 'FETCH'.
 SET TITLEBAR 'SALES HEADER DATA'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
CASE sy-ucomm.
  WHEN 'E1' OR 'CANCEL' OR 'BACK'.
    LEAVE PROGRAM.
  WHEN 'FD1'.
      PERFORM get_vbak.
  WHEN 'CAPTURE'.
    GET CURSOR FIELD g_field VALUE g_value.
    PERFORM get_vbap.
    CALL SCREEN 200.
ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_vbak
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbak .

  SELECT vbeln
         erdat
         erzet
         ernam
         audat
    FROM vbak
    INTO TABLE it_vbak
   WHERE vbeln IN s_vbeln.
  IF sy-subrc = 0.
    tc1-lines = sy-dbcnt.
  ELSE.
    MESSAGE 'Data Not Fetched' TYPE 'I'.
  ENDIF.

ENDFORM.
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
*&---------------------------------------------------------------------*
*& Form get_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbap .


    SELECT vbeln
           posnr
           matnr
           pstyv
           posar
      FROM vbap
      INTO TABLE it_vbap
     WHERE vbeln = g_value.

ENDFORM.
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'FETCH'.
 SET TITLEBAR 'SALES ITEM'.
ENDMODULE.
