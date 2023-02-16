*&---------------------------------------------------------------------*
*& Report Z1013492_KNA1_VBAK_VBAP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_kna1_vbak_vbap.


DATA: it_vbak TYPE  Z1013492_VBAK_TABLE,
      wa_vbak TYPE Z1013492_VBAK_TABLE,
      it_vbap TYPE Z1013492_VBAP_TABLE,
      wa_vbap TYPE Z1013492_VBAP_TABLE,
      p_kunnr TYPE kna1-kunnr,
      g_name  TYPE RS38L_FNAM.


SELECT kunnr
       vbeln
       erdat
       erzet
       ernam
       audat
  FROM vbak
  INTO TABLE it_vbak
 WHERE kunnr = p_kunnr.

IF sy-subrc = 0 AND it_vbak IS NOT INITIAL.

SELECT kunnr_ana
       vbeln
       posnr
       matnr
       matwa
       pmatn
  FROM vbap
  INTO TABLE it_vbap
 WHERE kunnr_ana = p_KUNNR.

ELSE.

  MESSAGE 'Data Not Fetched' TYPE 'I'.

ENDIF.

CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    formname                 = 'Z1013492_KUNNR'
*   VARIANT                  = ' '
*   DIRECT_CALL              = ' '
 IMPORTING
    FM_NAME                  = G_NAME.
* EXCEPTIONS
*   NO_FORM                  = 1
*   NO_FUNCTION_MODULE       = 2
*   OTHERS                   = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
