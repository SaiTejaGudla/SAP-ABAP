*&---------------------------------------------------------------------*
*& Report Z1013492_DA_TYP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_DA_TYP.

TABLES:Z1013492_DA_TYP.

PARAMETERS: P_bank TYPE Z_BANK_ACC.

WRITE: p_bank.

CALL FUNCTION 'ENQUEUE_EZ_LOC'
 EXPORTING
   MODE_Z1013492_DA_TYP       = 'E'
   MANDT                      = SY-MANDT
   _SCOPE                     = '2'
*   _WAIT                      = ' '
*   _COLLECT                   = ' '
 EXCEPTIONS
   FOREIGN_LOCK               = 1
   SYSTEM_FAILURE             = 2
   OTHERS                     = 3
          .
IF sy-subrc <> 0.
MESSAGE ' IT WAS LOCKED BY USER' TYPE 'E'.
ENDIF.
