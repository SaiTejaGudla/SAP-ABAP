*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZFG_ADRES
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZFG_ADRES          .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
