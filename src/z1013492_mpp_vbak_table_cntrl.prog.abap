*&---------------------------------------------------------------------*
*& Report Z1013492_MPP_VBAK_TABLE_CNTRL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MPP_VBAK_TABLE_CNTRL.

TABLES: vbak.
CONTROLS sales_header TYPE TABLEVIEW USING SCREEN 100.

TYPES: BEGIN OF ty_vbak,
        vbeln TYPE vbak-vbeln,
        erdat TYPE vbak-erdat,
        erzet TYPE vbak-erzet,
        ernam TYPE vbak-ernam,
        audat TYPE vbak-audat,
        vbtyp TYPE vbak-vbtyp,
        auart TYPE vbak-auart,
        netwr TYPE vbak-netwr,
      END OF ty_vbak.

DATA : it_vbak TYPE TABLE OF ty_vbak,
       wa_vbak TYPE ty_vbak,
       g_vbeln TYPE vbak-vbeln.

SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
SELECT-OPTIONS s_vbeln FOR g_vbeln.
SELECTION-SCREEN END OF SCREEN 50.

CALL SCREEN 100.
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
  WHEN 'FC2' or 'CANCEL' OR 'BACK'.
    LEAVE PROGRAM.
  WHEN 'FC1' .
    PERFORM get_data.
ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .

  SELECT vbeln
         erdat
         erzet
         ernam
         audat
         vbtyp
         auart
         netwr
    FROM vbak
    INTO TABLE it_vbak
   WHERE vbeln in s_vbeln.

  IF sy-subrc = 0 AND it_vbak IS NOT INITIAL.

    sales_header-lines  = sy-dbcnt.

  ELSE.

    MESSAGE ' Data Not Fetched ' TYPE 'I'.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Module TABLE_CTRL OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE table_ctrl OUTPUT.
CLEAR vbak.

 vbak-vbeln = wa_vbak-vbeln.
 vbak-erdat = wa_vbak-erdat.
 vbak-erzet = wa_vbak-erzet.
 vbak-ernam = wa_vbak-ernam.
 vbak-audat = wa_vbak-audat.
 vbak-vbtyp = wa_vbak-vbtyp.
 vbak-auart = wa_vbak-auart.
 vbak-netwr = wa_vbak-netwr.

ENDMODULE.
