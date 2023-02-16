*&---------------------------------------------------------------------*
*& Report Z3492_ASSIGNMENT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z3492_assignment.
PARAMETERS p_number TYPE i.
DATA init TYPE i VALUE '1'.
DO 100 TIMES.
  write p_number.
  p_number = p_number + 1.
ENDDO.

*WHILE init <= 100.
*  WRITE p_number.
*  p_number = p_number + 1.
*  init = init + 1.
*ENDWHILE.
