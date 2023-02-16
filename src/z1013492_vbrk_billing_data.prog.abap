*&---------------------------------------------------------------------*
*& Report Z1013492_VBRK_BILLING_DATA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_vbrk_billing_data.

PARAMETERS: p_date TYPE dats.

TYPES:BEGIN OF ty_billing_data,
        kunnr TYPE kunnr,
        land1 TYPE  land1_gp,
        kunag TYPE kunag,
        vbeln TYPE vbeln_vf,
        fkdat TYPE fkdat,
      END OF ty_billing_data.

DATA: it_billing_data TYPE TABLE OF ty_billing_data,
      wa_billing_data TYPE ty_billing_data.

SELECT kn~kunnr
       kn~land1
       vk~kunag
       vk~vbeln
       vk~fkdat
  FROM kna1 AS kn
 INNER JOIN vbrk AS vk
    ON kn~kunnr = vk~kunag
  INTO TABLE it_billing_data.

IF sy-subrc = 0.
  LOOP AT it_billing_data INTO wa_billing_data.
  IF p_date = wa_billing_data-fkdat.
*    LOOP AT it_billing_data INTO wa_billing_data.
    wa_billing_data-fkdat = wa_billing_data-fkdat+5(1) - 6.
      WRITE:/ wa_billing_data-kunnr,
              wa_billing_data-land1,
              wa_billing_data-kunag,
              wa_billing_data-vbeln,
              wa_billing_data-fkdat.
    wa_billing_data-fkdat = wa_billing_data-fkdat + 1.
  ENDIF.
  ENDLOOP.
ENDIF.
