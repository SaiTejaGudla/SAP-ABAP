*&---------------------------------------------------------------------*
*& Report Z1013492_MPP_VBAK_VBAP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MPP_VBAK_VBAP.
TABLES: vbak, vbap.
CONTROLS TC TYPE TABLEVIEW USING SCREEN 100.

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

DATA: it_vbak TYPE  ty_vbak,
      it_vbap TYPE TABLE OF ty_vbap,
      wa_vbap TYPE ty_vbap,
      g_vbeln TYPE vbak-vbeln.

SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
PARAMETERS p_vbeln TYPE vbak-vbeln.
SELECTION-SCREEN END OF SCREEN 50.


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
    WHEN 'E1' or 'CANCEL' OR 'EXIT'.
      LEAVE PROGRAM.
    WHEN 'F1'.
      PERFORM get_vbak_vbap.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module TABLE_CNTRL OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE table_cntrl OUTPUT.
CLEAR VBAP.
vbap-vbeln = wa_vbap-vbeln.
vbap-posnr = wa_vbap-posnr.
vbap-matnr = wa_vbap-matnr.
vbap-pstyv = wa_vbap-pstyv.
vbap-posar = wa_vbap-posar.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_vbak_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbak_vbap .

  SELECT SINGLE vbeln
                erdat
                erzet
                ernam
                audat
           FROM vbak
           INTO CORRESPONDING FIELDS OF it_vbak
          WHERE vbeln = p_vbeln.

    IF sy-subrc = 0 AND it_vbak is NOT INITIAL.
      SELECT vbeln
             posnr
             matnr
             pstyv
             posar
        FROM vbap
        INTO TABLE IT_vbap
       WHERE vbeln = p_vbeln.
     IF sy-subrc = 0 AND it_vbap is NOT INITIAL.

       TC-lines = sy-dbcnt.
     ELSEif it_vbap is INITIAL.
       MESSAGE 'VBAP Data Not Fetched' TYPE 'I'.

     ENDIF.
     ENDIF.

ENDFORM.
