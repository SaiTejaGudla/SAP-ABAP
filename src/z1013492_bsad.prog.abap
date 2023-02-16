*&---------------------------------------------------------------------*
*& Report Z1013492_BSAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_bsad.

TYPE-POOLS: slis.

*PARAMETERS: p_kunnr TYPE kunnr.
**            p_date  TYPE bsad-augdt.



DATA: it_bsad TYPE TABLE OF Z1013492_BSAD_STRUCT,
      wa_bsad TYPE Z1013492_BSAD_STRUCT,

      it_fcat TYPE slis_t_fieldcat_alv,
      wa_fcat TYPE slis_fieldcat_alv.

SELECT-OPTIONS so_kunnr for wa_bsad-kunnr.

START-OF-SELECTION.

CALL FUNCTION 'ZFM_BSAD'
  EXPORTING
    SO_kunnr         = so_kunnr[]
*    date          = p_date
  CHANGING
    it_bsad       = it_bsad.


 wa_fcat-fieldname = 'KUNNR'.
 wa_fcat-col_pos   = 1.
 wa_fcat-seltext_m = 'Customer Number'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'BUKRS'.
 wa_fcat-col_pos   = 2.
 wa_fcat-seltext_m = 'Company Code'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'AUGDT'.
 wa_fcat-col_pos   = 3.
 wa_fcat-seltext_m = 'Clearing Date'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'AUGBL'.
 wa_fcat-col_pos   = 4.
 wa_fcat-seltext_m = 'Document Number'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'ZUONR'.
 wa_fcat-col_pos   = 5.
 wa_fcat-seltext_m = 'Assignment Number'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING

*   I_STRUCTURE_NAME                  = 'Z1013492_BSAD_STRUCT'

   IT_FIELDCAT                       = it_fcat

  TABLES
    t_outtab                          = it_bsad.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
