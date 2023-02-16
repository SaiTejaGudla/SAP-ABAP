*&---------------------------------------------------------------------*
*& Report Z1013492_INTERACTIVE_CUSTOMER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_interactive_customer.

TYPES:
* Structure to hold the customer details from KNA1 table
  BEGIN OF ty_kna1,
    kunnr TYPE kna1-kunnr,
    name1 TYPE kna1-name1,
    land1 TYPE kna1-land1,
    ort01 TYPE kna1-ort01,
  END OF ty_kna1,
* Structure to hold the customer details from VBAK table
  BEGIN OF ty_vbak,
    vbeln TYPE vbak-vbeln,
    erdat TYPE vbak-erdat,
    erzet TYPE vbak-erzet,
    ernam TYPE vbak-ernam,
    kunnr TYPE vbak-kunnr,
  END OF ty_vbak,
* Structure to hold the customer details from LIPS table
  BEGIN OF ty_lips,
    vbeln TYPE lips-vbeln,
    posnr TYPE lips-posnr,
    pstyv TYPE lips-pstyv,
    vgbel TYPE lips-vgbel,
  END OF ty_lips,
* Structure to hold the customer details from VBRP table
  BEGIN OF ty_vbrp,
    vbeln TYPE vbrp-vbeln,
    posnr TYPE vbrp-posnr,
    uepos TYPE vbrp-uepos,
    fkimg TYPE vbrp-fkimg,
  END OF ty_vbrp.


DATA:
* Internal table to hold the Customer Details as ty_kna1
  it_kna1 TYPE TABLE OF ty_kna1,
* Work area to hold the customer details as ty_kna1
  wa_kna1 TYPE ty_kna1,
* Internal table to hold the Customer details as ty_vbak
  it_vbak TYPE TABLE OF ty_vbak,
* Work area to hold the customer details as ty_vbak
  wa_vbak TYPE ty_vbak,
* Internal table to hold the Customer details as ty_lips
  it_lips TYPE TABLE OF ty_lips,
* Work area to hold the customer details as ty_lips
  wa_lips TYPE ty_lips,
* Internal table to hold the Customer details as ty_vbrp
  it_vbrp TYPE TABLE OF ty_vbrp,
* Work area to hold the customer details as ty_vbrp
  wa_vbrp TYPE ty_vbrp.



SELECTION-SCREEN BEGIN OF BLOCK bk1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(10) cm1.
  PARAMETERS : p_kunnr TYPE kna1-kunnr.
SELECTION-SCREEN END OF BLOCK bk1.

INITIALIZATION.

  t1 = ' DISPLAY CUSTOMER DETAILS INTERACTIVELY'.
  cm1 = ' ENTER THE CUSTOMER NUMBER'.

START-OF-SELECTION.

  SELECT kunnr
         name1
         land1
         ort01
   FROM kna1
   INTO TABLE it_kna1
  WHERE kunnr = p_kunnr.

  IF sy-subrc = 0 AND it_kna1 IS NOT INITIAL.

    LOOP AT it_kna1 INTO wa_kna1.
      WRITE:/ wa_kna1-kunnr,
              wa_kna1-name1,
              wa_kna1-land1,
              wa_kna1-ort01.
    ENDLOOP.
  ELSE.
    MESSAGE ' NO DATA FOUND ' TYPE 'E'.
  ENDIF.

END-OF-SELECTION.

AT LINE-SELECTION.
  IF sy-lsind = 1.
    SELECT  vbeln
            erdat
            erzet
            ernam
      FROM vbak INTO TABLE it_vbak WHERE kunnr = wa_kna1-kunnr.
    IF sy-subrc = 0 AND it_vbak IS NOT INITIAL.
      LOOP AT it_vbak INTO wa_vbak.
        WRITE : / wa_vbak-vbeln,
                  wa_vbak-erdat,
                  wa_vbak-erzet,
                  wa_vbak-ernam.
        HIDE wa_vbak-vbeln.
      ENDLOOP.
    ELSE.
      MESSAGE ' NO DATA FOUND ' TYPE 'E'.
    ENDIF.

  ELSEIF sy-lsind = 2.
    SELECT vbeln
           posnr
           pstyv
           vgbel
      FROM lips INTO TABLE it_lips WHERE vgbel = wa_vbak-vbeln.
    IF sy-subrc = 0 AND it_lips IS NOT INITIAL.
      LOOP AT it_lips INTO wa_lips.
        WRITE : / wa_lips-vbeln,
                   wa_lips-posnr,
                   wa_lips-pstyv,
                    wa_lips-vgbel.
        HIDE wa_lips-vgbel.
      ENDLOOP.
    ELSE.
      MESSAGE 'NO DATA FOUND ' TYPE 'E'.
    ENDIF.

  ELSEIF sy-lsind = 3.
    SELECT  vbeln
            posnr
            uepos
            fkimg
      FROM  vbrp INTO TABLE it_vbrp WHERE uepos = wa_lips-vgbel.
    IF sy-subrc = 0 AND it_vbrp IS NOT INITIAL.
      LOOP AT  it_vbrp INTO wa_vbrp.
        WRITE : / wa_vbrp-vbeln,
                  wa_vbrp-posnr,
                  wa_vbrp-uepos,
                  wa_vbrp-fkimg.
      ENDLOOP.
              HIDE wa_vbrp-vbeln.
    ELSE.
      MESSAGE 'Data Not Found' TYPE 'E'.
    ENDIF.
  ENDIF.
