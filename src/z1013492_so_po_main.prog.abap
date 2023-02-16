*&---------------------------------------------------------------------*
*& Include          Z1013492_SO_PO_MAIN
*&---------------------------------------------------------------------*


PERFORM screen-output.

*&---------------------------------------------------------------------*
*& Form screen-output
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM screen-output.
LOOP AT SCREEN.
    IF p_sales EQ 'X' AND screen-group1 = 'MD1'.
      Screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_sales EQ ' ' AND screen-group1 = 'MD1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_purc EQ 'X' AND screen-group1 = 'MD2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_purc EQ ' ' AND screen-group1 = 'MD2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.                               "IF P_sales...
  ENDLOOP.                              "Loop at Screen...
ENDFORM.
