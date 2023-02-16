*&---------------------------------------------------------------------*
*& Report Z1013492_ARTIMETIC_FUNCTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_ARTIMETIC_FUNCTION.

PARAMETERS: p_I1 TYPE i,
            p_I2 TYPE i,
            p_op(3) TYPE c.
DATA:       Result TYPE i.
CALL FUNCTION 'Z1013492_FUNCTION_ARTHIMETIC'
  EXPORTING
    input1          = p_I1
    input2          = p_I2
    operation       = p_op
 IMPORTING
   FINAL           = Result.
  WRITE Result.
