FUNCTION ZFM_BSAD.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(SO_KUNNR) TYPE  Z1013492_TT_SO_BSAD
*"  CHANGING
*"     REFERENCE(IT_BSAD) TYPE  Z1013492_BSAD_TABLE
*"----------------------------------------------------------------------
DATA: LN_KUNNR LIKE LINE OF SO_KUNNR.
RANGES: R_KUNNR FOR KNA1-KUNNR.

LOOP AT SO_KUNNR INTO LN_KUNNR.
  R_KUNNR-SIGN = LN_KUNNR-SIGN.
  R_KUNNR-OPTION = LN_KUNNR-OPTION.
  R_KUNNR-LOW = LN_KUNNR-LOW.
  R_KUNNR-HIGH = LN_KUNNR-HIGH.
  APPEND R_KUNNR.

ENDLOOP.

      SELECT  bukrs
              kunnr
              augdt
              augbl
              zuonr
         FROM bsad INTO TABLE it_bsad WHERE kunnr IN R_kunnr.

ENDFUNCTION.
