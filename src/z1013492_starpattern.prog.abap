*&---------------------------------------------------------------------*
*& Report Z1013492_STARPATTERN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_STARPATTERN.

DATA: g_star TYPE i VALUE 1.

 DO 5 TIMES.
  DO g_star TIMES.
    WRITE: '*'.
    IF g_star > 5.
       EXIT.
    ENDIF.
  ENDDO.
  WRITE:/.
  g_star = g_star + 1.
  ENDDO.
