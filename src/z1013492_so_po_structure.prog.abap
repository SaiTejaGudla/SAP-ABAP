*&---------------------------------------------------------------------*
*& Include Z1013492_SO_PO_STRUCTURE
*&---------------------------------------------------------------------*

TYPES:
  "Sructure for Sales Order
  BEGIN OF ty_sales,
    vbeln TYPE vbak-vbeln,
    erdat TYPE vbka-erdat,
    ernam TYPE vbak-ernam,
    vbtyp TYPE vbak-vbtyp,
    vkorg TYPE vbak-vkorg,
    audat TYPE vbak-audat,
    netwr TYPE vbak-netwr,
    posnr TYPE vbap-posnr,
    matnr TYPE vbap-matnr,
    zwert TYPE vbap-zwert,
    zmeng TYPE vbap-zmeng,
    zieme TYPE vbap-zieme,
    maktx TYPE makt-maktx,
  END OF ty_sales,

  "Structure For purchase Order
  BEGIN OF ty_purchase,
    ebeln TYPE ekko-ebeln,
    bukrs TYPE ekko-bukrs,
    bstyp TYPE ekko-bstyp,
    statu TYPE ekko-statu,
    aedat TYPE ekko-aedat,
    ernam TYPE ekko-ernam,
    ebelp TYPE ekpo-ebelp,
    matnr TYPE ekpo-matnr,
    txz01 TYPE ekpo-txz01,
    werks TYPE ekpo-werks,
    lgort TYPE ekpo-lgort,
    menge TYPE ekpo-menge,
    meins TYPE ekpo-meins,
    maktx TYPE makt-maktx,
  END OF ty_purchase.

DATA:
  " Internal Table to store the Sales Order Data
  it_sales    TYPE TABLE OF ty_sales,
  " Work Area to store the Sales order data
  wa_sales    TYPE ty_sales,

  " Internal table to store the purchase order Data
  it_purchase TYPE TABLE OF ty_purchase,
  "Work area to store the purchase order Data
  wa_purchase TYPE ty_purchase,

  "Variable to store the Price
  g_price     TYPE vbak-netwr,
  "Variable to store the Quantity
  g_quan      TYPE vbap-zmeng.
