*&---------------------------------------------------------------------*
*& Include          Z1013492_VBAK_VBAP_DISPLAY
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Form z1013492_vbak_vbap_display
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM z1013492_vbak_vbap_display.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING

    IT_FIELDCAT                       = it_fcat

    IT_SORT                           = it_sort

   TABLES
     t_outtab                          = it_data.
 IF sy-subrc <> 0.
MESSAGE 'DATA NOT FOUND' TYPE 'E'.
 ENDIF.

ENDFORM.
