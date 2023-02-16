*&---------------------------------------------------------------------*
*& Report Z3492_ASSIGNMENT2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z3492_ASSIGNMENT2.
*PARAMETERS num type string.
*data: number(4) type n value 1000.
*DO 9000 TIMES.
*  number = number + 1.
* If number mod 9 = + num.
*  write number.
*  number = number + 9.
*  ENDIF.
*ENDDO.
*
*


PARAMETERS num1 type c.
data: num2(4) type n value '999',
      num3(2) type n,
      num4 type n.
 DO 9000 TIMES.
    num2 = num2 + 1.
    num3 = num2+0(1) + num2+1(1) + num2+2(1) + num2+3(1).
    num4 = num3+0(1) + num3+1(1).
    if num4 = num1.
      write:/ num2.
      ELSEIF num4 > 9.
        EXIT.
     ELSEIF num1 = 0.
       exit.
      ELSEIF num2+0(1) = 0.
        exit.
      ENDIF.
 ENDDO.
