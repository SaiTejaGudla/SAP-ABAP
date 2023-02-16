* *&---------------------------------------------------------------------*
*& Report Z3492_WATERJUG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z3492_waterjug.
*PARAMETERS: Jug1(2)   TYPE c,
*            Jug2(2)   TYPE c,
*            Result(4) TYPE c.
*DATA: Even TYPE string VALUE '0 2 4 6 8',
*      Odd  TYPE string VALUE '1 3 5 7 9',
*      I1 TYPE i VALUE '0',
*      I2 TYPE i VALUE '0'.
*IF Result > Jug1 AND Result > Jug2.
*  EXIT.
*ELSEIF Result CO Odd AND Jug1 CO Even AND Jug2 CO Even.
*  EXIT.
*ELSEIF Jug1 = Jug2 AND Result NE Jug1 AND Result NE Jug2.
*  EXIT.
*ELSEIF Jug1 / 5 = 0 AND Jug2 / 5 = 0 AND Result / 5 <> 0.
*  EXIT.
**ELSEIF Jug1 = Jug2 * 2  and result <> Jug1 and Result <> Jug2.
**  EXIT.
**ELSEIF Jug2 = Jug1 * 2 and result <> Jug1 and Result <> Jug2.
**  EXIT.
*ELSEIF Jug1 >= Jug2.
**    I1 = Jug1.
*    while I1 <> Result or I2 <> Result.
*       I1 = Jug1.
*      WRITE: I1,
*             I2.
**      I1 = Jug1 - Jug2.
**      I2 = Jug2.
*     do.
*       I1 = Jug1 - Jug2.
*       I2 = Jug2.
*       write: I1, I2.
*      If I2 = Jug2 and I1 <> Result or I2 <> Result.
*        Do.
*          I2 = 0.
*          write:I1, I2.
*          enddo.
*        ElseIF I2 <> 0 or I2 < Jug2.
*          DO.
*            I2 = I1.
*            write I2.
*           Enddo.
*          while I1 = 0.
*              I1 = Jug1.
*              write: I1.
*            ENDWHILE.
*          ENDDO.
*
*      ENDWHILE.
*      ENDIF.
**     Enddo.
**      ENDWHILE.




*PARAMETERS: Jug1(2)   TYPE c,
*            Jug2(2)   TYPE c,
*            Result(4) TYPE c.
*DATA: Even TYPE string VALUE '0 2 4 6 8',
*      Odd  TYPE string VALUE '1 3 5 7 9',
*      I1 TYPE i VALUE '0',
*      I2 TYPE i VALUE '0',
*      Temp type i.
*IF Result > Jug1 AND Result > Jug2.
*  EXIT.
*ELSEIF Result CO Odd AND Jug1 CO Even AND Jug2 CO Even.
*  EXIT.
*ELSEIF Jug1 = Jug2 AND Result NE Jug1 AND Result NE Jug2.
*  EXIT.
*ELSEIF Jug1 / 5 = 0 AND Jug2 / 5 = 0 AND Result / 5 <> 0.
*  EXIT.
**ELSEIF Jug1 = Jug2 * 2  and result <> Jug1 and Result <> Jug2.
**  EXIT.
**ELSEIF Jug2 = Jug1 * 2 and result <> Jug1 and Result <> Jug2.
**  EXIT.
*ELSEIF Jug1 >= Jug2.
*    while I1 <> Result or I2 <> Result. "while I1 <> Result or I2 <> Result.
*       I1 = Jug1.
*      WRITE: I1, I2.
**      I1 = Jug1 - Jug2.
**      I2 = Jug2.
*     do.
*       I1 = Jug1 - Jug2.
*       I2 = Jug1 - I1.
*       write: I1, I2.
*      enddo.
*
*      If I2 = Jug2 and I1 <> Result or I2 <> Result.
*        Do.
*          I2 = 0.
*          write:I1, I2.
*          enddo.
*        ElseIF I2 <> 0 or I2 < Jug2 and I1 <> 0.
*          DO.
*            Temp = Jug2 - I2.
*             I2 = Temp + I2.
*             I1 = I1 - Temp.
*            write: I1, I2.
*           Enddo.
**        endif.
*          ELSEIF I1 = 0.
*              I1 = Jug1.
*              write: I1, I2.
*            ENDIF.
*
*      ENDWHILE.
*      ENDIF.
**      ENDWHILE.



*PARAMETERS: Jug1   TYPE c,
*            Jug2   TYPE c,
*            Result TYPE c.
*DATA: Even TYPE string VALUE '0 2 4 6 8',
*      Odd  TYPE string VALUE '1 3 5 7 9',
*      i1   TYPE i VALUE '0',
*      i2   TYPE i VALUE '0',
*      Temp TYPE i,
*      Val  TYPE i,
*      Val1 TYPE i.
*IF Result > Jug1 AND Result > Jug2.
*  EXIT.
*ELSEIF Result CO Odd AND Jug1 CO Even AND Jug2 CO Even.
*  EXIT.
*ELSEIF Jug1 = Jug2 AND Result NE Jug1 AND Result NE Jug2.
*  EXIT.
*ELSEIF Jug1 / 5 = 0 AND Jug2 / 5 = 0 AND Result / 5 <> 0.
*  EXIT.
*ENDIF.
**ELSEIF Jug1 = Jug2 * 2  and result <> Jug1 and Result <> Jug2.
**  EXIT.
**ELSEIF Jug2 = Jug1 * 2 and result <> Jug1 and Result <> Jug2.
**  EXIT.
*i1 = Jug1.
*i2 = Jug2.
*
*DO 1 TIMES.
*  IF i1 > i2.
*    i1 = Jug1.
*    i2 = 0.
*    WRITE: i1, i2.
*    Val = i1 - Jug2.
*    i1 = Val.
*    WRITE :/ i1.
*    i2 = Jug2.
*    WRITE : i2.
*  ENDIF.
*ENDDO.
*
*WHILE i1 <> Result OR i2 <> Result. "while I1 <> Result or I2 <> Result.
**
*  IF i2 = Jug2 AND i1 <> Result OR i2 <> Result.
**        val = I1 - I2.
**       I1 = Val.
**       write: I1.
**       I2 = Jug1 - I1.
**       write: I2.
**        write:I1, I2.
*    DO.
*      i2 = 0.
*      WRITE: i1 ,i2.
**          I2 = i1.
**           i1 = 0.
**           write: i1, i2.
*       Enddo.
*      while i1 <= Jug1 and i1 <> 0 OR  i1 >= Jug2 and i2 = 0.
*        Val1 = i1 - Jug2.
*        i1 = Val1.
*        i2 = Jug2.
*        WRITE: i1 , i2.
*       ENDWHILE.
*      while i1 <= Jug2 and i2 = 0.
*        i2 = i1.
*        i1 = 0.
*        WRITE : i1, i2.
*       ENDWHILE.
**      ELSEIF i1 <= Jug2.
**        i2 = i1.
**        i1 = 0.
**        WRITE: i1,i2.
**    ENDDO.
*  ELSEIF i1 = Jug1 AND i2 = 0.
*    i1 = i1 - Jug2.
*    i2 = Jug2.
*  ELSEIF i2 <> 0 OR i2 <> Jug2 AND i1 <> 0 OR i1 = Jug1.
*    DO.
*      Temp = Jug2 - i2.
*      i2 = Temp + i2.
*      i1 = i1 - Temp.
*      WRITE: i1, i2.
*    ENDDO.
*  ENDIF.
*  WHILE  i1 = 0 AND i1 <> Result OR i2 <> Result.
*    i1 = Jug1.
*    WRITE: i1, i2.
*  ENDWHILE.
**            ENDIF.
*ENDWHILE.
**      ENDWHILE.






*PARAMETERS: Jug1   TYPE c,
*            Jug2   TYPE c,
*            Result TYPE c.
*DATA: Even TYPE string VALUE '0 2 4 6 8',
*      Odd  TYPE string VALUE '1 3 5 7 9',
*      i1   TYPE i VALUE '0',
*      i2   TYPE i VALUE '0',
*      Temp TYPE i,
*      Val  TYPE i,
*      Val1 TYPE i,
*      Val2 TYPE i.
*IF Result > Jug1 AND Result > Jug2.
*  EXIT.
*ELSEIF Result CO Odd AND Jug1 CO Even AND Jug2 CO Even.
*  EXIT.
*ELSEIF Jug1 = Jug2 AND Result NE Jug1 AND Result NE Jug2.
*  EXIT.
*ELSEIF Jug1 / 5 = 0 AND Jug2 / 5 = 0 AND Result / 5 <> 0.
*  EXIT.
*ENDIF.
**ELSEIF Jug1 = Jug2 * 2  and result <> Jug1 and Result <> Jug2.
**  EXIT.
**ELSEIF Jug2 = Jug1 * 2 and result <> Jug1 and Result <> Jug2.
**  EXIT.
*i1 = Jug1.
*i2 = Jug2.
*
*DO 1 TIMES.
*  IF i1 > i2.
*    i1 = Jug1.
*    i2 = 0.
*    WRITE: i1, i2.
*    Val = i1 - Jug2.
*    i1 = Val.
*    WRITE :/ i1.
*    i2 = Jug2.
*    WRITE : i2.
*  ENDIF.
*ENDDO.
*
*WHILE i1 <> Result OR i2 <> Result. "while I1 <> Result or I2 <> Result.
**
*  IF i2 = Jug2 AND i1 <> Result OR i2 <> Result.
*    i2 = 0.
*    WRITE: i1 ,i2.
*    WHILE  i1 > Jug2  AND i2 = 0.
*      Val1 = i1 - Jug2.
*      i1 = Val1.
*      i2 = Jug2.
*      WRITE: i1 , i2.
*    ENDWHILE.
*    WHILE i1 <= Jug2 AND i2 = 0.
*      i2 = i1.
*      i1 = 0.
*      WRITE : i1, i2.
*    ENDWHILE.
*  ELSEIF i1 = Jug1 AND i2 = 0.
*    Val2 = i1 - Jug2.
*    i1 = Val2.
*    i2 = Jug2.
*    WRITE : i1, i2.
*  ELSEIF i2 <> 0 OR i2 <> Jug2 AND i1 <> 0 OR i1 = Jug1.
*    DO.
*      Temp = Jug2 - i2.
*      i2 = Temp + i2.
*      i1 = i1 - Temp.
*      WRITE: i1, i2.
*    ENDDO.
*  ENDIF.
*  WHILE  i1 = 0 AND i1 <> Result OR i2 <> Result.
*    i1 = Jug1.
*    WRITE: i1, i2.
*  ENDWHILE.
*ENDWHILE.
**      ENDWHILE.
**      ENDIF.




PARAMETERS: Jug1   TYPE i,
            Jug2   TYPE i,
            Result TYPE i.
DATA: i1    TYPE i VALUE '0',
      i2    TYPE i VALUE '0',
      Temp  TYPE i,
      Val   TYPE i,
      Val1  TYPE i,
      Val2  TYPE i,
      Val3  TYPE i,
      Count TYPE i VALUE '1'.
IF Jug1 = Result.
  WRITE: result , '0'.
  EXIT.
ELSEIF Jug2 = Result.
  WRITE: '0',Result.
  EXIT.
ENDIF.
IF Jug1 < Jug2.
  Val3 = Jug1.
  Jug1 = Jug2.
  Jug2 = Val3.
ENDIF.

IF Result > Jug1 AND Result > Jug2.
  WRITE ' NOT POSSIBLE '.
  EXIT.
ELSEIF Result MOD 2 <> 0 AND Jug1 MOD 2 = 0  AND Jug2 MOD 2 = 0.
  WRITE ' 1 NOT POSSIBLE'.
  EXIT.
ELSEIF Jug1 = Jug2 AND Result NE Jug1 AND Result NE Jug2.
  WRITE ' 2 NOT POSSIBLE'.
  EXIT.
ELSEIF Jug1 / 5 = 0 AND Jug2 / 5 = 0 AND Result / 5 <> 0.
  WRITE '  3 NOT POSSIBLE'.
  EXIT.
ELSEIF  Jug1 MOD Jug2 = 0 AND Jug1 = 1 AND Jug2 = 1 AND Result <> Jug1 AND Result <> Jug2.
  WRITE ' 4 NOT POSSIBLE'.
  EXIT.
ELSEIF Jug1 - Jug2 = Jug1 OR Jug1 - Jug2 = Jug2 AND Result <> Jug1 AND Result <> Jug2.
  WRITE ' 5 NOT POSSIBLE'.
  EXIT.
*ELSEIF JUG1 = 6 OR JUG2 = 6 AND JUG1 MOD JUG2 <> JUG2 - 1 OR JUG2 / 6 <> JUG1 - 1 AND RESULT = 5.
*  WRITE ' 6 NOT POSSIBLE '.
*  EXIT.
**ELSEIF Result NOT BETWEEN Jug1 AND Jug2. "AND Result NOT BETWEEN Jug2 AND Jug1.
*  WRITE ' 6 NOT POSSIBLE'.
*  EXIT.
*ELSEIF Result  BETWEEN Jug1 AND Jug2. "AND Result NOT BETWEEN Jug2 AND Jug1.
*  WRITE ' 6 NOT POSSIBLE'.
*  EXIT.
ENDIF.
i1 = Jug1.
i2 = Jug2.

DO 1 TIMES.
  IF i1 >= i2.
    i1 = Jug1.
    i2 = 0.
    WRITE: i1, i2.
    IF i1 = Result OR i2 = Result.
      EXIT.
    ENDIF.
    Val = i1 - Jug2.
    i1 = Val.
    WRITE :/ i1.
    i2 = Jug2.
    WRITE : i2.
  ENDIF.
ENDDO.

WHILE i1 <> Result AND i2 <> Result. "while I1 <> Result or I2 <> Result.
  IF i2 = Jug2 AND i1 <> Result AND i2 <> Result.
    i2 = 0.
    WRITE:/ i1 ,i2.
  ENDIF.
  IF  i1 > Jug2  AND i2 = 0.
    Val1 = i1 - Jug2.
    i1 = Val1.
    i2 = Jug2.
    WRITE:/ i1 , i2.
  ENDIF.
  IF i1 <= Jug2 AND i2 = 0.
    i2 = i1.
    i1 = 0.
    WRITE :/ i1, i2.
  ELSEIF i1 = Jug1 AND i2 = 0.
    Val2 = i1 - Jug2.
    i1 = Val2.
    i2 = Jug2.
    WRITE :/ i1, i2.
  ENDIF.
  IF i2 <> 0 AND i2 <> Jug2 AND i1 <> 0 AND i1 = Jug1.
    Temp = Jug2 - i2.
    i2 = Temp + i2.
    i1 = i1 - Temp.
    WRITE:/ i1, i2.
  ENDIF.
  WHILE i1 = 0 AND i1 <> Result AND i2 <> Result.
    i1 = Jug1.
    WRITE:/ i1, i2.
  ENDWHILE.
  Count = Count + 1.
ENDWHILE.
WRITE:/ ' NO OF ITERATOINS: ', COUNT.
