*&---------------------------------------------------------------------*
*& Report Z1013492_DATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_date.

PARAMETERS:
"Variable to Hold the Date
         p_date TYPE dats.

DATA:
"Variable to hold the date
         g_date    TYPE dats,
"Variable to hold the Week data
         g_week(5) TYPE c.

g_date = p_date.


WHILE g_date+5(1) EQ p_date+5(1).

  IF p_date+6(2)     BETWEEN 01 AND 07.
     g_week = 'Week1:'.
  ELSEIF p_date+6(2) BETWEEN 08 AND 14.
     g_week = 'Week2:'.
  ELSEIF p_date+6(2) BETWEEN 15 AND 21.
     g_week = 'Week3:'.
  ELSEIF p_date+6(2) BETWEEN 22 AND 28.
     g_week = 'Week4:'.
  ELSE.
     g_week = 'Week5:'.
  ENDIF.                               "Validating the Day...

  WRITE:/ g_week,p_date.
  p_date = p_date + 1.

ENDWHILE.                              "Validating the Month...
