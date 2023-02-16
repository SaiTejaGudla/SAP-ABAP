*&---------------------------------------------------------------------*
*& Report Z1013492_PRG2
*&---------------------------------------------------------------------*
*&
**&---------------------------------------------------------------------*
REPORT Z1013492_PRG2.
*parameters p_matnr type mara-matnr.
*write P_matnr.
*
*data p_sai(20) type c.
*P_sai = 'tejasaifgcghgfyt'.
*write p_sai.

*parameters: p_matnr type mara-matnr OBLIGATORY.
*write p_matnr.

types: BEGIN OF ty_mara,
matnr type matnr,
END OF ty_mara.

data: lv_matnr type mara-matnr.
data: it_mara type STANDARD TABLE OF ty_mara,
      wa_mara type ty_mara.
select-OPTIONS s_matnr for lv_matnr no INTERVALS.
select matnr from mara
       into table it_mara
       where matnr in s_matnr.
loop at it_mara into wa_mara.
write:/ wa_mara-matnr.
ENDLOOP.
