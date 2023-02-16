*&---------------------------------------------------------------------*
*& Include          Z1013492_SO_PO_LOGIC
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Form get_sal_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_sal_data .

  IF p_sales = 'X'.
    SELECT vbeln
           erdat
           ernam
           erzet
           vkorg
      FROM vbak
      INTO TABLE it_sal_head
     WHERE vbeln IN s_sal.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form show_sal_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM show_sal_data .

  IF sy-subrc = 0.
    LOOP AT it_sal_head INTO wa_sal_head.
      WRITE:/ wa_Sal_head-vbeln,
              wa_Sal_head-erdat,
              wa_Sal_head-ernam,
              wa_Sal_head-erzet,
              wa_Sal_head-vkorg.
      HIDE wa_sal_head-vbeln.
    ENDLOOP.                          "Loop at it_sal_head...
  ELSE.
    MESSAGE ' Data Not Found ' TYPE 'E'.
  ENDIF.                               "If sy-subrc...

ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_pur_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_pur_data .

  IF p_purc = 'X'.
    SELECT ebeln
          bukrs
          bstyp
          statu
          aedat
     FROM ekko
     INTO TABLE it_pur_head
    WHERE ebeln IN s_pur.
  ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form show_pur_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM show_pur_data .

  IF sy-subrc = 0.
    LOOP AT it_pur_head INTO wa_pur_head.
      WRITE:/ wa_pur_head-ebeln,
              wa_pur_head-bukrs,
              wa_pur_head-bstyp,
              wa_pur_head-statu,
              wa_pur_head-aedat.
      HIDE wa_pur_head-ebeln.
    ENDLOOP.                              "Loop at it_pur_head...
  ELSE.
    MESSAGE 'Data Not Found' TYPE 'E'.
  ENDIF.                                "If sy-subrc...


ENDFORM.
