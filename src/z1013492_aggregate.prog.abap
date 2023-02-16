*&---------------------------------------------------------------------*
*& Report Z1013492_AGGREGATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_AGGREGATE.

  DATA:
*   Global variable to hold the total sum value of the field
    g_sum   TYPE i,
*   Global variable to hold the total average value of the field
    g_avg   TYPE p,
*   Global variable to hold the total maximum value of the field
    g_max   TYPE Z1013492_DE_ORDR_PRICE,
*   Global variable to hold the total minimum value of the field
    g_min   TYPE Z1013492_DE_ORDR_PRICE,
*   Global variable to hold the total count of the field
    g_count TYPE i.

  SELECT SUM( ORDR_PRICE ) INTO g_sum FROM Z1013492_TORDER.
  WRITE:/ 'SUM',g_sum.

  SELECT AVG( ORDR_PRICE ) INTO g_avg FROM Z1013492_TORDER.
  WRITE:/ 'AVG',g_avg.

  SELECT MAX( ORDR_PRICE ) INTO g_max FROM Z1013492_TORDER.
  WRITE:/ 'MAX',g_max.

  SELECT MIN( ORDR_PRICE ) INTO g_min FROM Z1013492_TORDER.
  WRITE:/ 'MIN',g_min.

  SELECT COUNT( DISTINCT ORDR_PRICE ) INTO g_count FROM Z1013492_TORDER.
  WRITE:/ 'COUNT : No of diff values',g_count.

  CLEAR g_count.

  SELECT COUNT( * ) INTO g_count FROM z1013492_TORDER.
  WRITE:/ 'COUNT : No of Rows',g_count.
