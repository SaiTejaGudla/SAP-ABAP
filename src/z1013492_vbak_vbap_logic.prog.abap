*&---------------------------------------------------------------------*
*& Include          Z1013492_VBAK_VBAP_LOGIC
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Form z1013492_vbak_vbap_fetch
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM z1013492_vbak_vbap_fetch.

  SELECT vk~vbeln
       vk~erdat
       vk~erzet
       vp~ernam
       vp~matnr
       vp~netwr
  FROM vbak as vk
  INNER JOIN vbap as vp
  ON vk~vbeln = vp~vbeln
  INTO TABLE it_data.

 wa_fcat-fieldname = 'VBELN'.
 wa_fcat-col_pos   = 1.
 wa_fcat-seltext_m = 'Sales Document'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'ERDAT'.
 wa_fcat-col_pos   = 2.
 wa_fcat-seltext_m = 'Date on Record Created'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'erzet'.
 wa_fcat-col_pos   = 3.
 wa_fcat-seltext_m = 'Entry Time'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'ERNAM'.
 wa_fcat-col_pos   = 4.
 wa_fcat-seltext_m = 'Name of the Person'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'MATNR'.
 wa_fcat-col_pos   = 5.
 wa_fcat-seltext_m = 'Material Number'.
 APPEND wa_fcat to it_fcat.
 CLEAR wa_fcat.

 wa_fcat-fieldname = 'NETWR'.
 wa_fcat-col_pos   = 6.
 wa_fcat-seltext_m = 'Net Value'.
 wa_fcat-do_sum = 'X'.
 APPEND wa_fcat to it_fcat.


 wa_sort-spos = 1.
 wa_sort-fieldname = 'VBELN'.
 wa_sort-up = 'X'.
 wa_sort-subtot = 'X'.
 APPEND wa_sort to it_sort.

ENDFORM.
