*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_ASSIGNMENT_5.

TYPES:
* Structure to hold the customer details
  BEGIN OF ty_cust,
    kunnr TYPE kunnr,
    bstnk TYPE bstnk,
    kdmat TYPE matnr_ku,
  END   OF ty_cust.

DATA:
* Internal table to hold the cutomer details
  it_cust TYPE TABLE OF ty_cust,
* Workarea to hold the customer details
  wa_cust TYPE ty_cust.

SELECT kn~kunnr
       vk~bstnk
       vp~kdmat
  FROM kna1 AS kn
 INNER JOIN vbak AS vk
    ON kn~kunnr = vk~kunnr
 INNER JOIN vbap AS vp
    ON vk~vbeln = vp~vbeln
  INTO TABLE it_cust.

WRITE:/1 'kunnr',
      12 'bstnk',
      35 'kdmat'.
write:/ sy-uline+0(70).
LOOP AT it_cust INTO wa_cust.
  WRITE:/ wa_cust-kunnr,
          wa_cust-bstnk,
          wa_cust-kdmat.
ENDLOOP.                               " LOOP AT it_cust...
