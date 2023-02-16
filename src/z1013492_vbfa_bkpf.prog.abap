*&---------------------------------------------------------------------*
*& Report Z1013492_VBFA_BKPF
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_VBFA_BKPF.

INCLUDE z1013492_vbfa_bkpf_strct.

PERFORM get_vbfa_bkpf.
INCLUDE z1013492_vbfa_bkpf_main.

INITIALIZATION.
t1 = 'ACCOUTING DETAILS'.
COM1 = 'ENTER THE REQUIRED DETAILS'.
