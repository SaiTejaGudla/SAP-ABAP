*&---------------------------------------------------------------------*
*& Include          Z1013492_VBFA_BKPF_STRCT
*&---------------------------------------------------------------------*


TYPES:  BEGIN OF tY_vbfa,
         vbelv   TYPE vbeln_von,
         posnv   TYPE posnr_von,
         vbeln   TYPE vbfa-vbeln,
         posnn   TYPE vbfa-posnn,
         vbtyp_n TYPE vbfa-vbtyp_n,
       END OF tY_vbfa,

       BEGIN OF ty_bkpf,
         bukrs TYPE bkpf-bukrs,
         belnr TYPE bkpf-belnr,
         blart TYPE bkpf-blart,
         bldat TYPE bkpf-bldat,
         budat TYPE bkpf-budat,
         xblnr TYPE bkpf-xblnr,
       END OF tY_bkpf,

       BEGIN OF ty_final,
         vbelv   TYPE vbeln_von,
         posnv   TYPE posnr_von,
         vbeln   TYPE vbfa-vbeln,
         posnn   TYPE vbfa-posnn,
         vbtyp_n TYPE vbfa-vbtyp_n,
         vbtyp_v TYPE vbfa-vbtyp_v,
         bukrs   TYPE bkpf-bukrs,
         belnr   TYPE bkpf-belnr,
         blart   TYPE bkpf-blart,
         bldat   TYPE bkpf-bldat,
         budat   TYPE bkpf-budat,
         xblnr   TYPE bkpf-xblnr,
      END OF ty_final.

DATA:  it_vbfa   TYPE TABLE OF ty_vbfa,
       wa_vbfa   TYPE ty_vbfa,

       it_bkpf   TYPE TABLE OF ty_bkpf,
       wa_bkpf   TYPE ty_bkpf,

       it_final  TYPE TABLE OF ty_final,
       wa_final  TYPE ty_final,

       it_fcat   TYPE slis_t_fieldcat_alv,
       wa_fcat   LIKE LINE OF it_fcat,

       g_vbeln   TYPE vbfa-vbeln,
       g_posnn   TYPE vbfa-posnn,

       gs_LAYOUT TYPE slis_layout_alv.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
SELECTION-SCREEN COMMENT 2(20) COM1.
  SELECT-OPTIONS: s_vbeln FOR g_vbeln,
                  s_posnn FOR g_posnn.
SELECTION-SCREEN END OF BLOCK b1.
