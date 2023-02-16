*&---------------------------------------------------------------------*
*& Report Z3492_EXAMPLE1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z3492_EXAMPLE1.


DATA: it_mara type STANDARD TABLE OF mara,
      wa_mara type mara.

SELEct * from mara
  into TABLE it_mara UP TO 100 ROWS.

WRITE sy-uline+0(93).

WRITE:/1 sy-vline,
        3  'Material No',
       45 sy-vline,
       50 'Material Type', sy-vline,
       80 'Industry Sec', sy-vline.

WRITE sy-uline+0(93).

LOOP AT it_mara INTO wa_mara.

WRITE:/1 sy-vline,
       3 wa_mara-matnr,
       45 sy-vline,
       50 wa_mara-mtart,
       64 sy-vline,
       80 wa_mara-mbrsh,
       93 sy-vline.

WRITE sy-uline+0(93).
ENDLOOP.
