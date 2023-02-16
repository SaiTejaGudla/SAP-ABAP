*&---------------------------------------------------------------------*
*& Report Z1013492_SALES_HEADER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_sales_header.

" Include to hold the Structure
INCLUDE z1013492_sales_strct.

"Include to Hold the Main Program Logic
INCLUDE z1013492_sales_logic.

"Include to Hold the Display Data
INCLUDE z1013493_sales_display.

START-OF-SELECTION.

PERFORM get_data.

PERFORM Fieldcat.

PERFORM call_function.
