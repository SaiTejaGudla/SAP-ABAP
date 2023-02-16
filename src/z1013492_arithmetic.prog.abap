*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_ARITHMETIC.

PARAMETERS:
"Variable Declarations for  the Data
            p_I1      TYPE i,
            p_I2      TYPE i,
            P_Arth(3) TYPE c,
            P_final   TYPE i.
DATA :
"Memory to Hold the Above Variables
      Result TYPE i.

IF p_arth = 'ADD'.
  Result = p_I1 + p_I2.
ELSEIF p_arth = 'SUB'.
  Result = p_I1 - p_I2.
ELSEIF p_arth = 'MUL'.
  Result = p_I1 * p_I2.
ELSEIF p_arth = 'DIV'.
  Result = p_I1 / p_I2.
ELSEIF p_arth = 'MOD'.
  Result = p_I1 MOD p_I2.
ELSE.
  EXIT.
ENDIF.                                 "If to validate the Above Variables

IF p_final eq Result.
  WRITE 'True'.
ELSE.
  WRITE 'False'.
ENDIF.                                 "If to Print the O/P
