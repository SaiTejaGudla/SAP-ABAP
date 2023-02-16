*&---------------------------------------------------------------------*
*& Report Z1013492_PRACTICE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_practice.

***USING TABLES

*DATA: Z_MARA TYPE MARA.
*
*SELECT * from mara into z_mara UP TO 50 ROWS .
*
*WRITE : / z_mara-matnr,
*          z_mara-mtart,
*          z_mara-mbrsh.
*
*ENDSELECT.

***USING STRUCTURES

*DATA: Z_str TYPE zmara_3492.
*SELECT matnr
*       mtart
*       mbrsh  FROM mara INTO z_str WHERE matnr = '222111A' .
*  ENDSELECT.
*
*  WRITE : / z_str-z_matnr,
*            z_str-z_mtart,
*            z_str-z_mbrsh.

***USING INTERAL TABLE WITH HEADERLINE

*DATA:BEGIN OF TY_STR OCCURS 5,
*      VAR1 TYPE MATNR,
*      VAR2 TYPE MARA-MTART,
*      VAR3 TYPE zmara_3492-Z_MBRSH,
*     END OF TY_STR.
*
*SELECT MATNR
*       MTART
*       MBRSH FROM MARA INTO TABLE TY_STR UP TO 10 ROWS.
*
*LOOP AT TY_STR INTO TY_STR.
*
*WRITE:/ TY_STR-VAR1,
*        TY_STR-VAR2,
*        TY_STR-VAR3.
*
*ENDLOOP.

*** USING INTERNAL TABLE WITHOUT HEADERLINE.

*TYPES: BEGIN OF TY_STR,
*      VAR1 TYPE MATNR,
*      VAR2 TYPE MARA-MTART,
*      VAR3 TYPE zmara_3492-Z_MBRSH,
*     END OF TY_STR.
*
*DATA: WA_STR TYPE TY_STR,
*      IT_STR TYPE TY_STR.
*
*SELECT MATNR
*       MTART
*       MBRSH FROM MARA INTO TABLE IT_STR.
*
*LOOP AT IT_STR INTO WA_STR.
*
*WRITE:/ WA_STR-VAR1,
*        WA_STR-VAR2,
*        WA_STR-VAR3.
*
*ENDLOOP.

*TYPES: BEGIN OF ty_str,
*      VAR2 TYPE MARA-MTART,
*      VAR3 TYPE zmara_3492-Z_MBRSH,
*     END OF TY_STR.
*
*DATA: WA_STR TYPE TY_STR,
*      IT_STR TYPE TABLE OF TY_STR.
*
*wa_str-var2 = '232'.
*WA_STR-VAR3 = 'GSD'.
*APPEND WA_STR TO IT_STR.
*
*wa_str-var2 = '231'.
*WA_STR-VAR3 = 'KAHS'.
*APPEND WA_STR TO IT_STR.
*
*LOOP AT IT_STR INTO WA_STR.
*
*
*WRITE:/ WA_STR-VAR2,
*      / WA_STR-VAR3.
*
*ENDLOOP.

***Work Area Declaration

*DATA: BEGIN OF ty_str,
*      var1 TYPE matnr,
*      var2 TYPE c,
*      var3 TYPE string,
*      end of   ty_str.
*
*DATA: wa_mara TYPE mara.
*
*select * from mara INTO wa_mara where matnr = 'T-RMP1188'.
*ENDSELECT.
*
*  write:/ wa_mara-matnr,
*          wa_mara-mtart,
*          wa_mara-mbrsh.

*DATA: wa_str TYPE zstr.
*
*wa_str-address = 'GANDHINAGAR'.
*wa_str-city    = 'VIAJAYWADA'.
*wa_str-country = 'INDIA'.
*
*write:/ wa_str-address,
*        wa_str-city,
*        wa_str-country.

***INTERNAL TABLE WITH HEADERLINE.

*DATA: BEGIN OF TY_STR OCCURS 0,
*      Z_VAR1 TYPE MATNR,
*      Z_VAR2 TYPE MARA-MTART,
*      Z_VAR3 TYPE INTEGER,
*     END OF ty_str.
*
*ty_str-z_var1 = '89832'.
*ty_str-z_var2 = 'yte'.
*ty_str-z_var3 = '87'.
*
*WRITE:/ ty_str-z_var1,
*        ty_str-z_var2,
*        ty_str-z_var3.

***INTERNAL TABLE WITHOUT HEADERLINE.

TYPES: BEGIN OF ty_prac,
       z_a1 TYPE c,
       z_a2 TYPE string,
       z_a3 TYPE c,
      END OF ty_prac.

*DATA wa_prac  TYPE ty_prac.
*DATA it_prac TYPE ty_prac.

DATA: wa_prac TYPE ty_prac,
      it_prac TYPE TABLE OF ty_prac.
