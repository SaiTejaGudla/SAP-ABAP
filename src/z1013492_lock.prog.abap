*&---------------------------------------------------------------------*
*& Report Z1013492_LOCK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_LOCK.
CALL FUNCTION 'ENQUEUE_EZ_LOC'
EXPORTING
  MODE_Z1013492_DA_TYP       = 'S'
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
MESSAGE 'IT WAS LOCKED BY ANOTHER USER' TYPE 'I'.
ENDIF.
