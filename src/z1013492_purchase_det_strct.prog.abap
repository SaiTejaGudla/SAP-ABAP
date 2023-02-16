*&---------------------------------------------------------------------*
*& Include          Z1013492_PURCHASE_DET_STRCT
*&---------------------------------------------------------------------*

TYPES: BEGIN OF ty_purchase_details,
               lifnr TYPE  ekko-lifnr,
               ebeln TYPE  ekko-ebeln,
               aedat TYPE  ekpo-aedat,
               ebelp TYPE  ekpo-ebelp,
               matnr TYPE  ekpo-matnr,
               menge TYPE  ekpo-menge,
               kzfme TYPE  ekpo-kzfme,
       END OF ty_purchase_details.

DATA: it_details TYPE TABLE OF ty_purchase_details,
      wa_details TYPE ty_purchase_details,

      it_fcat TYPE slis_t_fieldcat_alv,
      wa_fcat TYPE slis_fieldcat_alv,

      it_header TYPE slis_t_listheader,
      wa_header TYPE slis_listheader,

      gs_layout TYPE slis_layout_alv.
