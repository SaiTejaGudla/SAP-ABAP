*&---------------------------------------------------------------------*
*& Report Z3492_CURRENT_DATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z3492_CURRENT_DATE.

PARAMETERS: p_date TYPE dats.

p_date = p_date + 1.
write: p_date.
