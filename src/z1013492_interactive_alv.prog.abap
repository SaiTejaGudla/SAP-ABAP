*&---------------------------------------------------------------------*
*& Report Z1013492_INTERACTIVE_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_INTERACTIVE_ALV.

INCLUDE z1013492_alv_strct.

START-OF-SELECTION.

PERFORM get_vbak_data.

PERFORM fieldcat_vbak.

PERFORM call_function_vbak.

INCLUDE z1013492_alv_main_vbak.

INCLUDE z1013492_alv_main_vbap.

*INCLUDE z1013492_alv_main_mara.
