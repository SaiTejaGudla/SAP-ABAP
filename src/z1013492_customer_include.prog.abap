
*&---------------------------------------------------------------------*
*& Report Z1013492_CUSTOMER_INCLUDE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_CUSTOMER_INCLUDE.

INCLUDE Z1013492_INCLUDE_CUST_DET.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(25) com1.
  SELECT-OPTIONS :
 "select option for p_kunnr
                  S_kunnr FOR (kna1-kunnr).
SELECTION-SCREEN END OF BLOCK b1.


INITIALIZATION.
t1   = ' DISPLAY CUSTOMER DETAILS'.
com1 = ' ENTER THE DATA'.

START-OF-SELECTION.

PERFORM get_data.
PERFORM display_data.

FORM get_data.

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
     WHERE kn~kunnr in s_kunnr.

SORT it_cust by kunnr.
ENDFORM.

FORM display_data.
 IF it_cust is NOT INITIAL.

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

  ENDFORM.
