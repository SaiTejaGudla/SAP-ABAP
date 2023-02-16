*&---------------------------------------------------------------------*
*& Report Z1013492_KNA1_COUNTRY_CODE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_kna1_country_code.

TYPES :
  "Structure to hold the some Data from kna1 table.

  BEGIN OF ty_kna1,
    land1 TYPE kna1-land1,
    kunnr TYPE kna1-kunnr,
    name1 TYPE kna1-name1,
    name2 TYPE kna1-name2,
    ort01 TYPE kna1-ort01,
    pstlz TYPE kna1-pstlz,
    regio TYPE kna1-regio,
  END OF ty_KNA1.

DATA :
  "Internal Table to Hold the ty_kna1 structure.
  it_kna1  TYPE TABLE OF ty_kna1,
  "Work Area to Hold the ty_kna1 Structure.
  Wa_KNA1  TYPE ty_kna1,

  it_final TYPE TABLE OF ty_kna1,
  wa_final TYPE ty_kna1,

  G_land1  TYPE kna1-land1.


SELECT-OPTIONS: s_land1 FOR g_land1.   "Variable to Hold the Country Code.

WRITE:/ SY-ULINE.
WRITE:/14 SY-VLINE,
       15 'COUNTRY CODE', 30 SY-VLINE,
       32 'CUSTOMER NUMBER', 47 SY-VLINE,
       48 'FIRST NAME', 59 SY-VLINE,
       60 'MIDDLE NAME', 72 SY-VLINE,
       73 'CITY', 78 SY-VLINE,
       79 'POSTAL CODE', 91 SY-VLINE,
       92 'REGION', 100 SY-VLINE.
WRITE:/ SY-ULINE.


SELECT land1
       kunnr
       name1
       name2
       ort01
       pstlz
       regio
  FROM kna1
  INTO TABLE it_kna1
 WHERE land1 IN S_land1.


IF sy-subrc = 0 AND it_kna1 IS NOT INITIAL.

  SORT it_kna1 BY LAND1.

  LOOP AT it_kna1 INTO wa_kna1.

    AT NEW land1.
      WRITE:/'COUNTRY CODE:' COLOR 6, SY-VLINE,15 wa_kna1-land1 COLOR 5, 30 SY-VLINE.
    ENDAT.
      WRITE:/32 wa_kna1-kunnr, 47 SY-VLINE,
             48 wa_kna1-name1, 59 SY-VLINE,
             60 wa_kna1-name2, 72 SY-VLINE,
             73 wa_kna1-ort01, 78 SY-VLINE,
             79 wa_kna1-pstlz, 91 SY-VLINE,
             92 wa_kna1-regio,100 SY-VLINE.
      WRITE:/ SY-ULINE.

  ENDLOOP.                             "Loop at...


ELSE.
  MESSAGE 'DATA NOT FOUND' TYPE 'E'.

ENDIF.                                 "If Sy-subrc = 0...
