*&---------------------------------------------------------------------*
*& Include          Z1013492_SO_PO_INTERACTIVE
*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*
*& Form get_sal_item
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_sal_item .

  IF p_sales = 'X'.

    IF sy-lsind = 1.
      SELECT vbeln
             posnr
             matnr
             matwa
             pmatn
        FROM vbap
        INTO TABLE it_sal_item
       WHERE vbeln = wa_sal_head-vbeln.
    ENDIF.                              "If sy-lsind ...

  ENDIF.                                "If p_sales...

ENDFORM.
*&---------------------------------------------------------------------*
*& Form show_sal_item
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM show_sal_item .

  IF sy-subrc = 0.
    LOOP AT it_sal_item INTO wa_sal_item.
      WRITE:/ wa_sal_item-vbeln,
              wa_sal_item-posnr,
              wa_sal_item-matnr,
              wa_sal_item-matwa,
              wa_sal_item-pmatn.
    ENDLOOP.                           "LOOP AT it_sal_item...
  ELSE.
    MESSAGE ' Data Not Found ' TYPE 'E'.
  ENDIF.                               "If sy-subrc...

ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_pur_item
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_pur_item .

  IF p_purc = 'X'.

    IF sy-lsind = 1.
      SELECT ebeln
             ebelp
             aedat
             matnr
             bukrs
        FROM ekpo
        INTO TABLE it_pur_item
       WHERE ebeln = wa_pur_head-ebeln.
    ENDIF.                             "If sy-lsind...

  ENDIF.                               "If p_purc...

ENDFORM.
*&---------------------------------------------------------------------*
*& Form show_pur_item
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM show_pur_item .

  IF sy-subrc = 0.

    LOOP AT it_pur_item INTO wa_pur_item.
      WRITE:/ wa_pur_item-ebeln,
              wa_pur_item-ebelp,
              wa_pur_item-aedat,
              wa_pur_item-matnr,
              wa_pur_item-bukrs.
    ENDLOOP.                           "Loop at it_pur_item...
  ELSE.
    MESSAGE 'Data Not Found' TYPE 'E'.
  ENDIF.                               "IF sy-subrc...


ENDFORM.
