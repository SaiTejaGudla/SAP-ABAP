*&---------------------------------------------------------------------*
*& Report Z3492_TEST1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z3492_test1.

*
TYPES: BEGIN OF ty_mara,
         matnr TYPE mara-matnr,
         mbrsh TYPE mara-mbrsh,
         maktx TYPE text40,
       END OF ty_mara.
DATA: it_mara TYPE TABLE OF ty_mara,
      wa_mara TYPE ty_mara.
DATA lv_matnr TYPE matnr.
SELECT-OPTIONS s_matnr FOR lv_matnr.
SELECT mar~matnr
       mar~mbrsh
       mak~maktx
  FROM mara as mar INNER JOIN makt as mak on mar~matnr = mak~matnr INTO TABLE it_mara UP TO 100 ROWS
 where mar~matnr in s_matnr.
LOOP AT it_mara INTO wa_mara.
  WRITE:/1 wa_mara-matnr,
         30 wa_mara-mbrsh,
         60 wa_mara-maktx.
ENDLOOP.





*DATA : I1 type string VALUE 'SAP',
*       I2 type string VALUE 'ABAP',
*       I3 type string.
*CONCATENATE I1 I2 INTO I3 SEPARATED BY ' '.
*write I3.
*
*PARAMETERS Input type i.
*IF Input = 1.
*  WRITE 'Monday'.
*ELSEIF Input = 2.
*  WRITE 'Tuesday'.
*ELSEIF Input = 3.
*  WRITE 'Wednesday'.
*ELSEIF Input = 4.
*WRITE 'Thursday'.
*ELSEIF Input = 5.
*  WRITE 'Friday'.
*ELSEIF Input = 6.
*  WRITE 'Saturday'.
*ELSEIF Input = 7.
*  WRITE 'Sunday'.
*ENDIF.


*PARAMETERS input(10) type n.
*shift input LEFT DELETING LEADING '0'.
*WRITE input.

**
*PARAMETERS input type string.
*DATA: I1 type c VALUE 'T',
*      I2 type c value 'V'.
*REPLACE all OCCURRENCES OF 'T' in input WITH 'V'.
*write input.


*DATA date type dats VALUE '20220323'.
*write:/ 'Year:', date+0(4),
*      /  'Month:', date+4(2),
*      / 'Day:', date+6(2).

*
*DATA:Length type string VALUE 'JFSGuee',
*     output type i.
*output = strlen( Length ).
*write output.
*
