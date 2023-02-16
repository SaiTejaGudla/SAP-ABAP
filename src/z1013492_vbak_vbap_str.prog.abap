*&---------------------------------------------------------------------*
*& Include          Z1013492_VBAK_VBAP_STR
*&---------------------------------------------------------------------*

TYPE-POOLS: SlIS.

TYPES: BEGIN OF ty_data,
       VBELN TYPE vbak-vbeln,
       ERDAT TYPE vbak-erdat,
       ERZET TYPE vbak-erzet,
       ERNAM TYPE vbak-ernam,
       matnr TYPE vbap-matnr,
       netwr TYPE vbap-netwr,
      END OF ty_data.

DATA: it_data TYPE TABLE OF ty_data,
      wa_data TYPE ty_data,

      it_fcat TYPE slis_t_fieldcat_alv,
      wa_fcat TYPE slis_fieldcat_alv,

      it_sort TYPE slis_t_sortinfo_alv,
      wa_sort TYPE slis_sortinfo_alv.
