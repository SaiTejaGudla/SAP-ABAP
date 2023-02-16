*&---------------------------------------------------------------------*
*& Report Z1013492_VBAK_VBAP_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_VBAK_VBAP_ALV.

INCLUDE z1013492_vbak_vbap_str.

START-OF-SELECTION.

PERFORM z1013492_vbak_vbap_fetch.

INCLUDE z1013492_vbak_vbap_logic.

END-OF-SELECTION.

PERFORM z1013492_vbak_vbap_display.

INCLUDE Z1013492_vbak_vbap_display.
