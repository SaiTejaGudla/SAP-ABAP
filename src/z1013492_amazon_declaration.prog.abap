*&---------------------------------------------------------------------*
*& Include          Z1013492_AMAZON_DECLARATION
*&---------------------------------------------------------------------*

DATA: it_amazon TYPE TABLE OF z1013492_tuser,
      wa_amazon TYPE z1013492_tuser,

      it_fcat TYPE slis_t_fieldcat_alv,
      wa_fcat TYPE slis_fieldcat_alv,

      it_header TYPE slis_t_listheader,
      wa_header TYPE slis_listheader,

      gs_layout TYPE slis_layout_alv.
