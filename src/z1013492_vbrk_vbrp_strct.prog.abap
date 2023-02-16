*&---------------------------------------------------------------------*
*& Include          Z1013492_VBRK_VBRP_STRCT
*&---------------------------------------------------------------------*

TYPES: BEGIN OF ts_vbrk,
          vbeln TYPE vbrk-vbeln,
          fkart TYPE VBRK-FKART,
          fktyp TYPE vbrk-fktyp,
          vbtyp TYPE vbrk-vbtyp,
          waerk TYPE vbrk-waerk,
          vkorg TYPE vbrk-vkorg,
       END OF ts_vbrk,

       BEGIN OF ts_vbrp,
          vbeln TYPE vbrp-vbeln,
          posnr TYPE vbrp-posnr,
          uepos TYPE vbrp-uepos,
          fkimg TYPE vbrp-fkimg,
          vrkme TYPE vbrp-vrkme,
          aubel TYPE vbrp-aubel,
       END OF ts_vbrp,

       BEGIN OF ty_final,
          vbeln TYPE vbrk-vbeln,
          FKART TYPE VBRK-FKART,
          fktyp TYPE vbrk-fktyp,
          vbtyp TYPE vbrk-vbtyp,
          waerk TYPE vbrk-waerk,
          vkorg TYPE vbrk-vkorg,
          posnr TYPE vbrp-posnr,
          uepos TYPE vbrp-uepos,
          fkimg TYPE vbrp-fkimg,
          vrkme TYPE vbrp-vrkme,
          aubel TYPE vbrp-aubel,
      END OF ty_final.


DATA: it_vbrk TYPE TABLE OF ts_vbrk,
      wa_vbrk TYPE ts_vbrk,

      it_vbrp TYPE TABLE OF ts_vbrp,
      wa_vbrp TYPE ts_vbrp,

      it_final TYPE TABLE OF ty_final,
      wa_final TYPE ty_final,

      it_fcat TYPE slis_t_fieldcat_alv,
      wa_fcat TYPE slis_fieldcat_alv,

      it_header TYPE slis_t_listheader,
      wa_header TYPE slis_listheader,

      gs_layout TYPE slis_layout_alv,

      g_vbeln TYPE vbrk-vbeln.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
SELECTION-SCREEN COMMENT 5(30) c1.
 SELECT-OPTIONS: s_vbeln FOR g_vbeln.
SELECTION-SCREEN END OF BLOCK b1.
