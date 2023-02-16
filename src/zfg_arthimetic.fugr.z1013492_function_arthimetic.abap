FUNCTION z1013492_function_arthimetic.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(INPUT1) TYPE  I
*"     REFERENCE(INPUT2) TYPE  I
*"     REFERENCE(OPERATION) TYPE  C
*"  EXPORTING
*"     REFERENCE(FINAL) TYPE  I
*"----------------------------------------------------------------------

  CASE operation.
    WHEN 'ADD'.
      final = input1 + input2.
    WHEN 'SUB'.
      IF input1 > input2.
        final = input1 - input2.
      ELSEIF input1 < input2.
        final = input1 - input2.
      ENDIF.
    WHEN 'MUL'.
      final = input1 * input2.
    WHEN 'DIV'.
      final = input1 / input2.
    WHEN OTHERS.
      MESSAGE ' GIVE CORRECT OPERATION' TYPE 'I'.
  ENDCASE.


ENDFUNCTION.
