*&---------------------------------------------------------------------*
*& Report Z1013492_STRING_OPERATIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_STRING_OPERATIONS.

PARAMETERS: p_I1 TYPE string,
            p_I2 TYPE string,
            p_I3 TYPE string,
            p_Oprtn TYPE string,
            p_val TYPE string,
            RP1 TYPE string,
            RP TYPE string.


DATA:
      Final TYPE STRING,
      Op1(15) TYPE c,
      Op2(15) TYPE c,
      Op3(15) TYPE c.

PERFORM get_data USING p_I1
                       p_I2
                       p_I3
                       p_Oprtn
                       p_val
                       RP1
                       RP
               CHANGING final.

PERFORM exception.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_I1
*&      --> P_I2
*&      --> P_I3
*&      --> P_OPRTN
*&      --> P_VAL
*&      --> RP1
*&      --> RP
*&      <-- FINAL
*&---------------------------------------------------------------------*
FORM get_data  USING    p_p_i1
                        p_p_i2
                        p_p_i3
                        p_p_oprtn
                        p_p_val
                        p_rp1
                        p_rp
               CHANGING p_final.
  CALL FUNCTION 'Z1013492_FM_STRING_OPERATIONS'
  EXPORTING
    input1          = p_p_I1
    input2          = p_P_I2
    input3          = p_p_I3
    operation       = p_p_Oprtn
    VALUE           = p_p_Val
    re1             = p_RP1
 IMPORTING
   RESULT          = p_Final
   O1              = Op1
   O2              = Op2
   O3              = OP3
   REPLACE         = p_RP.
  WRITE:/ 'RESULT:', Final,
      /  Op1,
      /  Op2,
      /  Op3,
      /  RP.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form exception
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM exception .

  IF p_I1 = 0 AND p_i2 = 0.
    MESSAGE 'Enter Data' TYPE 'I'.

  ENDIF.

ENDFORM.
