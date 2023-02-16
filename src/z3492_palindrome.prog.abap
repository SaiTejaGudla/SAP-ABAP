*&---------------------------------------------------------------------*
*& Report Z3492_PALINDROME
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z3492_palindrome.

PARAMETERS: P_number TYPE string.
DATA: g_var    TYPE string,
      g_len    TYPE i,
      g_temp   TYPE string,
      g_result TYPE string.

g_len = strlen( p_number ). " String Length.
g_var = g_len - 1. " Index length

DO g_len TIMES.
  g_temp = p_number+g_var(1).

  CONCATENATE g_temp g_result INTO g_result.
  g_var = g_var - 1.
  IF g_var < 0 .
    EXIT.

  ENDIF.

ENDDO.

IF p_number eq g_result.
  WRITE 'IT IS A PALINDROME '.
ELSE.
  WRITE ' IT IS NOT A PALINDROME '.
ENDIF.
