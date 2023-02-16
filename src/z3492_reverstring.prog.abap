*&---------------------------------------------------------------------*
*& Report Z3492_REVERSTRING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z3492_REVERSTRING.

DATA lv_string(5) type C.
SELECT-OPTIONS s_str for lv_string.

DATA: LV_REV TYPE string10,
      G_LEN TYPE I,
      LV_LEN TYPE I.

G_LEN = S_STR-HIGH - S_STR-LOW.
LV_LEN = strlen( S_STR-high ).
DO G_LEN TIMES.
If LV_LEN = 2.
LV_REV = S_STR-HIGH+1(1) && S_STR-HIGH+0(1).
ELSEIF LV_LEN = 3.
LV_REV = S_STR-HIGH+2(1) && S_STR-HIGH+1(1) && S_STR-HIGH+0(1).
ELSEIF LV_LEN = 4.
LV_REV = S_STR-HIGH+3(1) && S_STR-HIGH+2(1) && S_STR-HIGH+1(1) && S_STR-HIGH+0(1).
ENDIF.

 WRITE:/ S_STR-HIGH, 'REVERSE:', LV_REV.
 S_STR-HIGH = S_STR-HIGH - 1.

  CONDENSE S_STR-HIGH NO-GAPS.

ENDDO.
