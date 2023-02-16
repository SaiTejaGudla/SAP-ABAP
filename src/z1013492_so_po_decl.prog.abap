*&---------------------------------------------------------------------*
*& Include          Z1013492_SO_PO_DECL
*&---------------------------------------------------------------------*

TYPES:
  "Sructure to hold the Sales Header Data
  BEGIN OF ty_sal_head,
    vbeln TYPE vbak-vbeln,             "Sales Document
    erdat TYPE vbka-erdat,             "Date On Which the Record Created
    ernam TYPE vbak-ernam,             "Name of Person
    erzet TYPE vbak-erzet,             "Entry Time
    vkorg TYPE vbak-vkorg,             "Sales Organization
  END OF ty_sal_head,

  "structure to hold the Sales Item Data
  BEGIN OF ty_sal_item,
    vbeln TYPE vbap-vbeln,             "Sales Document
    posnr TYPE vbap-posnr,             "Sales Document Item
    matnr TYPE vbap-matnr,             "Material Number
    matwa TYPE vbap-matwa,             "Material Entered
    pmatn TYPE vbap-pmatn,             "Pricing Reference Material
  END OF ty_sal_item,


  "Structure to Hold the  purchase Order Data
  BEGIN OF ty_pur_head,
    ebeln TYPE ekko-ebeln,             "Purchase Document No
    bukrs TYPE ekko-bukrs,             "Company Code
    bstyp TYPE ekko-bstyp,             "Purchase Document Category
    statu TYPE ekko-statu,             "Status of Purchasing Document
    aedat TYPE ekko-aedat,             "Creation Date
  END OF ty_pur_head,

  "Structure to Hold the Purchase Item Data
  BEGIN OF ty_pur_item,
    ebeln TYPE ekpo-ebeln,             "Purchase Document No
    ebelp TYPE ekpo-ebelp,             "Item Number
    aedat TYPE ekpo-aedat,             "Purchase Document Item Change Date
    matnr TYPE ekpo-matnr,             "Material Number
    bukrs TYPE ekpo-bukrs,             "Company Code
  END OF ty_puR_item.

DATA:
  " Internal Table to store the Sales Header Data
  it_sal_head TYPE TABLE OF ty_sal_head,
  " Work Area to store the Sales Header data
  wa_sal_head TYPE ty_sal_head,

  "Internal Table to store the Sales Item Data
  it_sal_item TYPE TABLE OF ty_sal_item,
  "Work Area to Store the Sales Item Data
  wa_sal_item TYPE ty_sal_item,

  " Internal table to store the purchase Header Data
  it_pur_head TYPE TABLE OF ty_pur_head,
  "Work area to store the purchase Header Data
  wa_pur_head TYPE ty_pur_head,

  "Internal table to store the Purchase Item Data
  it_pur_item TYPE TABLE OF ty_pur_item,
  "Work Area to store the Purchase Item Data
  wa_pur_item TYPE ty_pur_item,

  g_sal TYPE vbak-vbeln,
  g_pur TYPE ekko-ebeln.

  SELECTION-SCREEN BEGIN OF BLOCK bk1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 1(50) com1.
  PARAMETERS:     p_sales RADIOBUTTON GROUP rad1 USER-COMMAND uc1, "Varaible for Sales as Radiobutton
                  p_purc  RADIOBUTTON GROUP rad1 DEFAULT 'X'.      "Variable for Purchase as Radiobutton
  SELECT-OPTIONS: s_sal FOR g_sal MODIF ID md1,         "Varaible for Sales Document No As Select-options
                  s_pur FOR g_pur MODIF ID md2.         "Variable for Purchase Document No As Select-options

SELECTION-SCREEN END OF BLOCK bk1.
