*&---------------------------------------------------------------------*
*& INCLUDE Z1013492_EKKO_EKPO_STR
*&---------------------------------------------------------------------*
TYPES : BEGIN OF ty_ekko,
          ebeln TYPE ekko-ebeln,       "purchasing document number
          bukrs TYPE ekko-bukrs,       "company code
          bstyp TYPE ekko-bstyp,       "purchasing document category
          bsart TYPE ekko-bsart,       "order type (purchasing)
          aedat TYPE ekko-aedat,       "last changed on
          lifnr TYPE ekko-lifnr,       "account number of supplier
        END OF ty_ekko,
        BEGIN OF ty_ekpo,
          ebeln TYPE ekpo-ebeln,       "purchasing document number
          ebelp TYPE ekpo-ebelp,       "item number of purchasing document
          menge TYPE ekpo-menge,       "component quantity
          meins TYPE ekpo-meins,       "base unit of measure
          peinh TYPE ekpo-peinh,       "price unit
          netpr TYPE ekpo-netpr,       "net price
          adrn2 TYPE ekpo-adrn2,       "number of delivery address
        END OF ty_ekpo,
        BEGIN OF ty_final,
          ebeln  TYPE ekko-ebeln,      "purchasing document number
          bukrs  TYPE ekko-bukrs,      "company code
          bstyp  TYPE ekko-bstyp,      "purchasing document category
          bsart  TYPE ekko-bsart,      "order type (purchasing)
          aedat  TYPE ekko-aedat,      "last changed on
          lifnr  TYPE ekko-lifnr,      "account number of supplier
          ebelp  TYPE ekpo-ebelp,      "item number of purchasing document
          menge  TYPE ekpo-menge,      "component quantity
          meins  TYPE ekpo-meins,      "base unit of measure
          peinh  TYPE ekpo-peinh,      "price unit
          netpr  TYPE ekpo-netpr,      "net price
          adrn2  TYPE ekpo-adrn2,      "number of delivery address
          colour TYPE char5,
        END OF ty_final,
        BEGIN OF ty_lfa,
          lifnr TYPE lfa1-lifnr,       "account number of supplier
          land1 TYPE lfa1-land1,       "country/region key
          name1 TYPE lfa1-name1,       "name
          name2 TYPE lfa1-name2,       "name 2
        END OF ty_lfa.
DATA : it_ekko   TYPE TABLE OF ty_ekko,
       wa_ekko   TYPE ty_ekko,
       it_ekpo   TYPE TABLE OF ty_ekpo,
       wa_ekpo   TYPE ty_ekpo,
       it_final  TYPE TABLE OF ty_final,
       wa_final  TYPE ty_final,
       it_lfa1   TYPE TABLE OF ty_lfa,
       wa_lfa1   TYPE ty_lfa,
       it_fcat   TYPE slis_t_fieldcat_alv,
       wa_fcat   TYPE slis_fieldcat_alv,
       it_header TYPE slis_t_listheader,
       wa_header TYPE slis_listheader,
       it_sort   TYPE slis_t_sortinfo_alv,
       wa_sort   TYPE slis_sortinfo_alv,
       it_event  TYPE slis_t_event,
       wa_event  LIKE LINE OF it_event,
       gs_layout TYPE slis_layout_alv,
       g_ebeln   TYPE ekko-ebeln.      "purchasing document number
SELECTION-SCREEN BEGIN OF BLOCK bk1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(20) com1.
  SELECT-OPTIONS: s_ebeln FOR g_ebeln.
SELECTION-SCREEN END OF BLOCK bk1.
