*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z1013492_FOODTAB
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z1013492_FOODTAB   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
