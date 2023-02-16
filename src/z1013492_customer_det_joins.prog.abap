*&---------------------------------------------------------------------*
*& Report Z1013492_CUSTOMER_DET_JOINS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_CUSTOMER_DET_JOINS.

PARAMETERS:
* variable to enter the customer number
       p_kunnr TYPE kna1-kunnr.

TYPES:
* Structure to get customer details from KNA1 table
  BEGIN OF ty_cust,
    kunnr TYPE kna1-kunnr,
    name1 TYPE kna1-name1,
    land1 TYPE kna1-land1,
    ort01 TYPE kna1-ort01,
    vbeln TYPE vbak-vbeln,
    erdat TYPE vbak-erdat,
    erzet TYPE vbak-erzet,
    ernam TYPE vbak-ernam,
    posnr TYPE lips-posnr,
    pstyv TYPE lips-pstyv,
    vgbel TYPE lips-vgbel,
    uepos TYPE vbrp-uepos,
    fkimg TYPE vbrp-fkimg,
  END OF ty_cust.

DATA:
* Internal table to hold the data from kna1 table
  it_cust TYPE TABLE OF ty_cust,
* Work area to hold the data from kna1 table
  wa_cust TYPE ty_cust.


START-OF-SELECTION.

  SELECT kn~kunnr
         kn~name1
         kn~land1
         kn~ort01
         vk~vbeln
         vk~erdat
         vk~erzet
         vk~ernam
         lp~posnr
         lp~pstyv
         lp~vgbel
         vr~uepos
         vr~fkimg

      INTO TABLE it_cust
      FROM kna1 as kn
      INNER JOIN vbak as vk
         ON kn~kunnr = vk~kunnr
      INNER JOIN lips as lp
         ON vk~vbeln = lp~vgbel
      INNER JOIN vbrp as vr
         ON lp~vbeln = vr~vgbel
      WHERE kn~kunnr = p_kunnr.

 IF sy-subrc = 0.

  LOOP AT it_cust INTO wa_cust.

    WRITE:/1  wa_cust-kunnr,
          10  wa_cust-name1,
          20  wa_cust-land1,
          30  wa_cust-ort01,
          40  wa_cust-vbeln,
          50  wa_cust-erdat,
          60  wa_cust-erzet,
          70  wa_cust-ernam,
          80  wa_cust-posnr,
          90  wa_cust-pstyv,
          100 wa_cust-vgbel,
          110 wa_cust-uepos,
          120 wa_cust-fkimg.

  ENDLOOP.                             " Loop at it_str_cust...

  ENDIF.

END-OF-SELECTION.
