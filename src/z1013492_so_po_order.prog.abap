*&---------------------------------------------------------------------*
*& Report Z1013492_SO_PO_ORDER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_so_po_order.

INCLUDE z1013492_so_po_decl.

INITIALIZATION.
  t1   = 'SALES AND PURCHASE ORDER DETAILS'.
  com1 = ' SELECT THE RADIOBUTTON TO GET THE REQUIRED DATA'.

AT SELECTION-SCREEN OUTPUT.

INCLUDE z1013492_so_po_main.

START-OF-SELECTION.

PERFORM get_sal_data.

PERFORM show_sal_data.

PERFORM get_pur_data.

PERFORM show_pur_data.

INCLUDE z1013492_so_po_logic.

END-OF-SELECTION.

AT LINE-SELECTION.

PERFORM get_sal_item.

PERFORM show_sal_item.

PERFORM get_pur_item.

PERFORM show_pur_item.

INCLUDE z1013492_so_po_interactive.
