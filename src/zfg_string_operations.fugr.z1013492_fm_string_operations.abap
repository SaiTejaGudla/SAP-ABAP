FUNCTION Z1013492_FM_STRING_OPERATIONS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(INPUT1) TYPE  STRING
*"     REFERENCE(INPUT2) TYPE  STRING
*"     REFERENCE(INPUT3) TYPE  STRING
*"     REFERENCE(OPERATION) TYPE  STRING
*"     REFERENCE(VALUE) TYPE  STRING
*"     REFERENCE(RE1) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(RESULT) TYPE  STRING
*"     REFERENCE(O1) TYPE  C
*"     REFERENCE(O2) TYPE  C
*"     REFERENCE(O3) TYPE  C
*"     REFERENCE(REPLACE) TYPE  STRING
*"----------------------------------------------------------------------

CASE operation.
  WHEN 'CONCATENATE'.
    CONCATENATE Input1 Input2 Input3 INTO Result.
   " WRITE: Result.
  WHEN 'SPLIT'.
    SPLIT Value at ' ' INTO O1 O2 O3.
*    WRITE:/'Value-', Value,
*           'Input1-', O1,
*           'Input2-', O2,
*           'Input3-', O3.
*   WHEN 'CONDENSE'.
*     CONDENSE Value NO-GAPS.
**     Result = Input1.
*     Result = Value.
*     WRITE: Result.
   WHEN 'REPLACE'.
     REPLACE 'SAP' WITH RE1 INTO Replace.
*     WRITE:/ 'Input1-', Input1,
*             'Input2-', Input2,
*             'Result:', Result.
   WHEN 'SEARCH'.
     SEARCH Input2 FOR Input1.
     IF sy-subrc = 0.
       WRITE 'Found'.
      ELSE.
        WRITE 'Not Found'.
      ENDIF.
    WHEN 'OFFSET'.
      WRITE: 'Day:', Input1+6(2),
             'Month:', Input1+4(2),
             'Year:', Input1+0(4).
*     WHEN 'SHIFT'.
*       SHIFT Input1 LEFT DELETING LEADING '0'.
*       O1 = Input1.
*       WRITE: O1.
     WHEN 'LENGTH'.

       result = strlen( Value ).
      WRITE: Input1.

  WHEN OTHERS.
    MESSAGE 'Give Correct Operation' TYPE 'I'.
ENDCASE.



ENDFUNCTION.
