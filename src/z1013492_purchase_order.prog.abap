*&---------------------------------------------------------------------*
*& Report Z1013492_PURCHASE_ORDER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_PURCHASE_ORDER.

INCLUDE z1013492_purchase_det_strct.

START-OF-SELECTION.

PERFORM get_pur_data.

PERFORM pur_fieldcat.

PERFORM top_of_page.

INCLUDE z1013492_purchase_main.

END-OF-SELECTION.

PERFORM call_function.

PERFORM call_top_of_page.

INCLUDE z1013492_purchase_display.
