*&---------------------------------------------------------------------*
*& Report Z1013492_MATERIAL_MASTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MATERIAL_MASTER.

TYPES: BEGIN OF ty_det,
       matnr TYPE mara-matnr,
       mtart TYPE mara-mtart,
       mbrsh TYPE mara-mbrsh,
       maktx TYPE makt-maktx,
       spras TYPE makt-spras,
       END OF ty_det.

DATA: it_det TYPE TABLE OF ty_det,
      wa_det TYPE ty_det.

SELECTION-SCREEN BEGIN OF BLOCK bk1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(40) com1.
  select-OPTIONS s_mat for (matnr).
SELECTION-SCREEN END OF BLOCK bk1.

INITIALIZATION.
t1 = 'MATERIAL MASTER'.
com1 = 'GIVE THE MATERIAL NUMBER'.

START-OF-SELECTION.
 SELECT mara~matnr
        mara~matnr
        mara~mbrsh
        makt~maktx
        makt~spras
   FROM mara INNER JOIN makt
     ON mara~matnr = makt~matnr
   INTO TABLE it_det
  WHERE mara~matnr IN s_mat.

   WRITE:/ sy-uline+0(111),
         /1 sy-vline,
         2 'Material Number', 22 sy-vline,
        24 'Material Type',   40 sy-vline,
        42 'Industry Sector', 57 sy-vline,
        60 'Description',     100 sy-vline,
       102 'Language',        111 sy-vline.
   write:/ sy-uline+0(111).
LOOP AT it_det INTO wa_det.

  WRITE:/1 sy-vline,
         2 wa_det-matnr, 22 sy-vline,
        24 wa_det-mtart, 40 sy-vline,
        42 wa_det-mbrsh, 57 sy-vline,
        60 wa_det-maktx, 100 sy-vline,
       102 wa_det-spras, 111 sy-vline.
  write:/ sy-uline+0(111).

  ENDLOOP.
