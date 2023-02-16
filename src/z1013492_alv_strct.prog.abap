*&---------------------------------------------------------------------*
*& Include          Z1013492_ALV_STRCT
*&---------------------------------------------------------------------*

TYPES: BEGIN OF ty_vbak,
        vbeln TYPE vbak-vbeln,
        erdat TYPE vbak-erdat,
        erzet TYPE vbak-erzet,
        ernam TYPE vbak-ernam,
       END OF   ty_vbak,

       BEGIN OF ty_vbap,
         posnr TYPE vbap-posnr,
         matnr TYPE vbap-matnr,
         matwa TYPE vbap-matwa,
       END OF ty_vbap,

       BEGIN OF ty_mara,
         matnr TYPE mara-matnr,
         laeda TYPE mara-laeda,
         aenam TYPE mara-aenam,
         vpsta TYPE mara-vpsta,
       END OF ty_mara.

 DATA: it_vbak TYPE TABLE OF ty_vbak,
       wa_vbak TYPE ty_vbak,

       it_vbap TYPE TABLE OF ty_vbap,
       wa_vbap TYPE ty_vbap,

       it_mara TYPE TABLE OF ty_mara,
       wa_mara TYPE ty_mara,

       it_fcat TYPE slis_t_fieldcat_alv,
       wa_fcat TYPE slis_fieldcat_alv,


       it_header TYPE slis_t_listheader,
       wa_header TYPE slis_listheader,

       gs_layout TYPE slis_layout_alv,

       g_vbeln   TYPE vbak-vbeln,

       P_VBELN   TYPE VBAK-VBELN,

       g_name    TYPE RS38L_FNAM.

SELECT-OPTIONS: s_vbeln FOR g_vbeln.
