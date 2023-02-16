*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_17
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MARA.

TYPES:
"Structure to hold the Fields of Mara
    BEGIN OF ty_mara,
     Matnr           TYPE matnr,
     ersda           TYPE ersda,
     created_at_time TYPE tims,
     ernam           TYPE ernam,
     laeda           TYPE laeda,
    END OF ty_mara.

DATA:
"Internal Table to hold the Fields of Mara
             it_mara TYPE TABLE OF ty_mara,
"Work Area to hold the Fields of Mara
             wa_mara TYPE ty_mara.

SELECT matnr
       ersda
       created_at_time
       ernam
       laeda
  FROM mara INTO TABLE it_mara.

WRITE:/1 'Matnr',
      41 'Ersda',
      50 'Created At Time',
      68 'Ernam',
      81 'Laeda'.
WRITE:/ sy-uline+0(140).
LOOP AT it_mara INTO wa_mara.

  WRITE:/1 wa_mara-matnr,
        41  wa_mara-ersda,
        55  wa_mara-created_at_time,
        68  wa_mara-ernam,
        81  wa_mara-laeda.
ENDLOOP.                               "Loop at it_mara...
