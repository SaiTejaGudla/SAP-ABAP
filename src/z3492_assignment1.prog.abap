*&---------------------------------------------------------------------*
*& Report Z3492_ASSIGNMENT1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z3492_assignment1.
*DATA:num(4) type c value '1000',
*      num1(4) type c.
*
*DO 9000 TIMES.
*  move num to num1.
*    num = num + 1.
*    IF num+0(1) = num+1(1) and num+2(1) = num+3(1).
*      write:/ num.
*    ENDIF.
*ENDDO.



*while num1+0(1) = num1+1(1).
*     write: num1+0(1),
*            num1+1(1),
*            num1+2(1),
*            num1+3(1).
*
* ENDWHILE.
*
*IF num1+0(1) = num1+1(1).
*  write num1.
*
*ENDIF.



*move num to num1.

*DATA:num type i value '1000',
*      num1(4) type c.
*DO 9000 TIMES.
*  move num to num1.
*    num1 = num1 + 1.
*    IF num1+0(1) = num1+1(1) and num1+2(1) = num1+3(1).
*      write:/ num1.
*    ENDIF.
*ENDDO.


*data : c(10) type c,
*       c1 type c value '1',
*       c2 type c value '2',
*       c3 type c VALUE '3',
*       c4 type c value '4',
*       c5 type c value '5',
*       c6 type c value '6',
*       c7 type c value '7',
*       c8 type c value '8',
*       c9 type c value '9',
*       c0 type c value '0'.


*
*DATA:num(4) type n value '1000',
*      num1(4) type n,
*      num2(4) type n.
**      num3(4) type n.
*
*  num1 = num + 100.
*
*DO 90 times.
**   move num1 to num2.
*  while num2+2(1) = 9 and num2+3(1) = 9.
*    num1 = num1 + 1001.
*     move num1 to num2.
**    DO.
**    while num2+0(1) = num2+1(1) and num2+2(1) = num2+3(1).
*    IF num2+0(1) = num2+1(1) and num2+2(1) = num2+3(1).
*      write:/ num2.
*      num2 = num2 + 10.
*    ENDIF.
**      num1 = num1 + 1001.
**     ENDDO.
**    ENDWHILE.
**    num1 = num1 + 1001.
*   ENDWHILE.
**   num1 = num1 + 1001.
*ENDDO.

*DATA: num1 type string VALUE '1234567890',
*      num2 type string VALUE '1234567890',
*      num3 type string,
*      num4 type string,
*      num5 type string.
**while num5 = 9999.
**DO.
** while num5+0(1) = num5+1(1) and num5+2(1) = num5+3(1).
*   Do 9 TIMES.
*     num3 = num1+0(1).
*     if num3+0(1) = num2+0(1).
*        CONCATENATE num3+0(1) num2+0(1) INTO num4.
*         write num4.
*         SHIFT num2 right CIRCULAR.
*     endif.
*    enddo.
*  ENDWHILE.
*  ENDDO.
*  ENDWHILE.


*DATA:num(4) type n value '1000',
*      num1(4) type n,
*      num2(4) type n.
**      num3(4) type n.
*
*  num1 = num + 100.
**  write num1.
* move num1 to num2.
*DO."90 times.
**  while num1+2(1) = 9 and num1+3(1) = 9.
**    num1 = num1 + 10.
**     move num1 to num2.
*     while num2+2(1) = 9 and num2+3(1) = 9.
*    IF num2+0(1) = num2+1(1) and num2+2(1) = num2+3(1).
*      write:/ num2.
*      num2 = num2 + 10.
*    ENDIF.
**    num2 = num2 + 1001.
*   ENDWHILE.
*   num2 = num2 + 1001.
*ENDDO.



**DATA:num type string value '1000',
**      num1 type string.
**      num2 type string.
**
**  num1 = num + 100.
**  write num1.
** move num1 to num2.
**
**DO 10 times.
**     while num1+2(1) = 9 and num1+3(1) = 9.
**    IF num1+0(1) = num1+1(1) and num1+2(1) = num1+3(1).
**      move num1 to num2.
**      write:/ num1.
**      num1 = num1 + 10.
**      move num2 to num1.
**    ENDIF.
**   ENDWHILE.
**   num1 = num1 + 1001.
**ENDDO.


*
DATA:
* Variable to hold the value 1000
  num        TYPE string VALUE '1000',
* Variable to hold the value 1000
  num1       TYPE string,
* Variable to hold the value 1000
  num2       TYPE string,
  count      TYPE i VALUE '0',
* Variable to hold the value 1000
  countwhile TYPE i VALUE '0',
* Variable to hold the value 1000
  countif    TYPE i VALUE '0'.

num1 = num + 100.

DO 81 TIMES.
  IF num1+0(1) = num1+1(1) AND num1+2(1) = num1+3(1).
    WRITE:/ num1.
    num1 = num1 + 11.
    WHILE num1+2(1) = 9 AND num1+3(1) = 9.
      WRITE:/ num1.
      num1 = num1 + 1001.
      countwhile = countwhile + 1.
    ENDWHILE.                          " WHILE num1+2(1)...
    countif = countif + 1.
  ENDIF.                               " IF num1+0(1)...
  count = count + 1.

ENDDO.                                 " DO 81 TIMES
WRITE:/'countwhile:', countwhile.
WRITE:/ 'Total Count:',count.

*DATA:num type string value '1100',
*      num1 type string,
*      num2 type string,
*      count type i value '0'.
*num1 = num.
*DO 81 TIMES.
*    IF num1+0(1) = num1+1(1) and num1+2(1) = num1+3(1).
*      write:/ num1.
*      num1 = num1 + 11.
*    while num1+2(1) = 9 and num1+3(1) = 9.
*      write:/ num1.
*        num1 = num1 + 1001.
*   ENDWHILE.
*   ENDIF.
*  count = count + 1.
*ENDDO.
*write:/ 'Total Count:',count.
