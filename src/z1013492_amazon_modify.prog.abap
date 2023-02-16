*&---------------------------------------------------------------------*
*& Report Z1013492_AMAZON_MODIFY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_AMAZON_MODIFY.

INCLUDE Z1013492_amazon_declaration.


START-OF-SELECTION.

INCLUDE z1013492_amazon_main.

END-OF-SELECTION.

PERFORM call_fucntion.


INCLUDE z1013492_amazon_display.
