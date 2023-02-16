*&---------------------------------------------------------------------*
*& Include          Z1013492_PURCHASE_MAIN
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Form get_pur_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_pur_data .

  SELECT ek~lifnr
       ek~ebeln
       ep~aedat
       ep~ebelp
       ep~matnr
       ep~menge
       ep~kzfme
  FROM ekko AS ek
 INNER JOIN ekpo AS ep
    ON ek~ebeln = ep~ebeln
  INTO TABLE it_details.

SORT it_details by lifnr.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form pur_fieldcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM pur_fieldcat.

wa_fcat-fieldname = 'LIFNR'.
wa_fcat-col_pos   = 1.
wa_fcat-seltext_m = 'Vendor Account Number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-fieldname = 'EBELN'.
wa_fcat-col_pos   = 2.
wa_fcat-seltext_m = 'Purchasing Document Number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-fieldname = 'EBELP'.
wa_fcat-col_pos   = 3.
wa_fcat-seltext_m = 'Item Number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-fieldname = 'MATNR'.
wa_fcat-col_pos   = 4.
wa_fcat-seltext_m = 'Material Number'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-fieldname = 'MENGE'.
wa_fcat-col_pos   = 5.
wa_fcat-seltext_m = 'Purchase Order Quantity'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-fieldname = 'KZFME'.
wa_fcat-col_pos   = 6.
wa_fcat-seltext_m = 'UOM'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

wa_fcat-fieldname = 'AEDAT'.
wa_fcat-col_pos   = 7.
wa_fcat-seltext_m = 'Date'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

gs_layout-colwidth_optimize = 'X'.
gs_layout-zebra = 'X'.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form top_of_page
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM top_of_page .

  wa_header-typ = 'A'.
*  wa_header-key = 'NAME : '.
  wa_header-info = 'Purchase Order Details'.
  APPEND wa_header to it_header.

ENDFORM.
