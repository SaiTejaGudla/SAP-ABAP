*&---------------------------------------------------------------------*
*& Report Z3492_WATERJUGS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z3492_waterjugs.
PARAMETERS: Jug1   TYPE i,
            Jug2   TYPE i,
            Result TYPE i.
DATA: i1   TYPE i VALUE '0',
      i2   TYPE i VALUE '0',
      Temp TYPE i,
      Val  TYPE i,
      Val1 TYPE i,
      Val2 TYPE i.

IF Result > Jug1 AND Result > Jug2.
  WRITE '  1 NOT POSSIBLE'.
  EXIT.
ELSEIF Result MOD 2 <> 0 AND Jug1 MOD 2 = 0  AND Jug2 MOD 2 = 0.
  WRITE '2 NOT POSSIBLE'.
  EXIT.
ELSEIF Jug1 = Jug2 AND Result NE Jug1 AND Result NE Jug2.
  WRITE ' 3 NOT POSSIBLE'.
  EXIT.
ELSEIF Jug1 / 5 = 0 AND Jug2 / 5 = 0 AND Result / 5 <> 0.
  WRITE ' 4 NOT POSSIBLE'.
  EXIT.
ELSEIF  Jug1 MOD Jug2 = 0 AND Result <> Jug1 AND Result <> Jug2.
  WRITE '5 NOT POSSIBLE'.
  EXIT.
*ELSEIF Result NOT BETWEEN Jug1 AND Jug2 AND Result NOT BETWEEN Jug2 AND Jug1.
*  WRITE '6 NOT POSSIBLE'.
*  EXIT.
ENDIF.
*i1 = Jug1.
*i2 = Jug2.
IF i1 >= i2.
*DO 1 TIMES.
    i1 = Jug1.
    i2 = Jug2.
    DO 1 TIMES.
*  IF i1 >= i2.
    i1 = Jug1.
    i2 = 0.
    WRITE: i1, i2.
    Val = i1 - Jug2.
    i1 = Val.
    WRITE :/ i1.
    i2 = Jug2.
    WRITE : i2.
    ENDDO.
  ENDIF.
WHILE i1 <> Result AND i2 <> Result. "while I1 <> Result or I2 <> Result.
*
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
ENDWHILE.
*ENDIF.

IF i2 >= i1.
*DO 1 TIMES.
  i1 = Jug2.      "i1 = Jug1.
    i2 = Jug1.
    DO 1 TIMES.   " i2 = Jug2.
*  IF i2 >= i1.      "I1 >= I2.
    i1 = Jug2.        "i1 = Jug1.
    i2 = 0.             " i2 = 0.
    WRITE: i1, i2.
    Val = i1 - Jug1.    "Val = i1 - Jug2.
    i1 = Val.            "I1 = VAL
    WRITE :/ i1.
    i2 = Jug1.      "i1 = JUG2.
    WRITE : i2.     " WRITE : i2.
ENDDO.
ENDIF.

WHILE i1 <> Result AND i2 <> Result. "while I1 <> Result or I2 <> Result.
*
  IF i2 = Jug1 AND i1 <> Result AND i2 <> Result.
    i2 = 0.
    WRITE:/ i1 ,i2.
  ENDIF.
  IF  i1 > Jug1  AND i2 = 0.
    Val1 = i2 - Jug1.
    i2 = Val1.
    i1 = Jug1.
    WRITE:/ i1 , i2.
  ENDIF.
  IF i1 <= Jug1 AND i2 = 0.
    i2 = i1.
    i1 = 0.
    WRITE :/ i1, i2.
  ELSEIF i2 = Jug2 AND i1 = 0.
    Val2 = i2 - Jug1.
    i2 = Val2.
    i1 = Jug1.
    WRITE :/ i1, i2.
  ENDIF.
  IF i2 <> 0 AND i2 <> Jug1 AND i1 <> 0 AND i1 = Jug2.
    Temp = Jug1 - i2.
    i2 = Temp + i2.
    i1 = i1 - Temp.
    WRITE:/ i1, i2.
  ENDIF.
  WHILE i1 = 0 AND i1 <> Result AND i2 <> Result.
    i1 = Jug2.
    WRITE:/ i1, i2.
  ENDWHILE.
ENDWHILE.
