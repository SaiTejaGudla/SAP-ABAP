*&---------------------------------------------------------------------*
*& Report Z1013492_SO_PO_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_so_po_screen.

INCLUDE Z1013492_SO_PO_STRUCTURE.

SELECTION-SCREEN BEGIN OF BLOCK Cont1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 5(20) com1.
  PARAMETERS:
   " Variable for sales order Details as Radio Button.
              p_salord RADIOBUTTON GROUP rad1 USER-COMMAND uc1 DEFAULT 'X'.

  SELECT-OPTIONS: s_ord_n FOR (vbka-vbeln) MODIF ID md1, "Sales Document Number
                  s_itm_n FOR (vbap-posnr) MODIF ID md1, " Sales Item Number
                  s_date  FOR (vbak-erdat) MODIF ID md1, "Sales Document Created Date
                  s_name  FOR (vbak-ernam) MODIF ID md1. "Sales Document Created by

  PARAMETERS:
   " Variablefor purchase order Details as Radiobutton
                  p_purord RADIOBUTTON GROUP rad1.
  SELECT-OPTIONS: s_purord FOR (ekpo-ebeln) MODIF ID md2," DEFAULT 'X', "Purchase Document Number
                  s_puritm FOR (ekpo-ebelp) MODIF ID md2," Purchase Item Number
                  s_p_date FOR (ekpo-aedat) MODIF ID md2," Creation Date
                  s_p_name FOR (ekko-ernam) MODIF ID md2." Created by

SELECTION-SCREEN END OF BLOCK Cont1.

*  LOOP AT SCREEN.
*    IF screen-name = 'S_ORD_N'.
*       screen-required = 2.
*       MODIFY SCREEN.
*    ENDIF.
*    ENDLOOP.

AT SELECTION-SCREEN OUTPUT.
 PERFORM display_data.

START-OF-SELECTION.

PERFORM get_sales.

*&---------------------------------------------------------------------*
*& Form display_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_data .
  LOOP AT SCREEN.
    IF p_salord EQ 'X' AND screen-group1 = 'MD1'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_purord EQ 'X' AND screen-group1 = 'MD2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_salord EQ ' ' AND screen-group1 = 'MD1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_purord EQ ' ' AND screen-group1 = 'MD2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.                            "IF p_salord...
  ENDLOOP.                          "Loop at screen

ENDFORM.
INITIALIZATION.

  t1 = 'Sales Order & Purchase Order'.
  com1 = 'Sales & Purchase Order Details'.
*&---------------------------------------------------------------------*
*& Form get_sales
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_sales.
   IF p_salord = 'X'.

    SELECT vk~vbeln
           vk~erdat
           vk~ernam
           vk~vbtyp
           vk~vkorg
           vk~audat
           vk~netwr
           vp~posnr
           vp~matnr
           vp~zwert
           vp~zmeng
           vp~zieme
           mk~maktx
    FROM vbak AS vk
    INNER JOIN vbap AS vp
       ON vk~vbeln = vp~vbeln
    INNER JOIN makt as mk
       ON mk~matnr = vp~matnr
     INTO TABLE it_sales
    WHERE spras = sy-langu
      AND vk~vbeln IN s_ord_n
      AND vp~posnr IN s_itm_n
      AND vk~erdat IN s_date
      AND vk~ernam IN s_name.

*WRITE:/1 'Sale Doc',
*      12 'Item',
*      22 'Date',
*      36 'Name',
*      42 'Category',
*      48 'Created Date',
*      58 'NetPrice',
*      68 'SalDocItm',
*      76 'Mat No',
*      86 'Tar Val',
*      91 'Tar Quan',
*      98 'Tar Quan',
*     103 'Short Txt'.
*WRITE: sy-uline+0(110).

    LOOP AT it_sales INTO wa_sales.



      WRITE:/1 wa_sales-vbeln,
            12 wa_sales-erdat,
            23 wa_sales-ernam,
            36 wa_sales-vbtyp,
            42 wa_sales-vkorg,
            48 wa_sales-audat,
            58 wa_sales-netwr,
            68 wa_sales-posnr,
            76 wa_sales-matnr,
            86 wa_sales-zwert,
            91 wa_sales-zmeng,
            98 wa_sales-zieme,
           103 wa_sales-maktx.

      g_quan = g_quan + wa_sales-zmeng.
      g_price = g_price + wa_sales-netwr.

      AT NEW vbeln.
        WRITE:/ 'Total Quantity:' COLOR 3 , g_quan,
              /  'Total Price:' COLOR 5,    g_price.
      ENDAT.
    ENDLOOP.                           "LOOP AT...
    ENDIF.                             "if p_salord = 'X'
*    ELSEIF p_purord = 'X'.
*    PERFORM get_purchase.


ENDFORM.
START-OF-SELECTION.
PERFORM get_purchase.

*&---------------------------------------------------------------------*
*& Form get_purchase
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

FORM get_purchase .
  IF p_purord = 'X'.
  SELECT   ek~ebeln
           ek~bukrs
           ek~bstyp
           ek~statu
           ek~aedat
           ek~ernam
           ep~ebelp
           ep~matnr
           ep~txz01
           ep~werks
           ep~lgort
           ep~menge
           ep~meins
           mk~maktx
     FROM ekko AS ek
    INNER JOIN ekpo AS ep
       ON ek~ebeln = ep~ebeln
    INNER JOIN makt AS mk
       ON mk~matnr = ep~matnr
     INTO TABLE it_purchase
    WHERE ek~ebeln IN s_purord
       OR ep~ebelp IN s_puritm
       OR ep~aedat IN s_p_date
       OR ek~ernam IN s_p_name.

    LOOP AT it_purchase INTO wa_purchase.
      WRITE:/ wa_purchase-ebeln,
              wa_purchase-bukrs,
              wa_purchase-bstyp,
              wa_purchase-statu,
              wa_purchase-aedat,
              wa_purchase-ernam,
              wa_purchase-ebelp,
              wa_purchase-matnr,
              wa_purchase-txz01,
              wa_purchase-werks,
              wa_purchase-lgort,
              wa_purchase-menge,
              wa_purchase-meins,
              wa_purchase-maktx.
    ENDLOOP.                           "Loop at...
ENDIF.                                 "if p_purord= 'X'...
ENDFORM.
