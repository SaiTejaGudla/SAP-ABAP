*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_18
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_ASSIGNMENT_18.
TYPES:
"Structure to hold the Sales Data
     BEGIN OF ty_sales,
           Customer(10) TYPE c,
      Customer_Name(35) TYPE c,
               VKORG(4) TYPE c,
               VTWEG(2) TYPE c,
               SPART(2) TYPE c,
       END OF ty_sales.

DATA:
"Internal Table to hold the Sales Data
     it_tab TYPE TABLE OF ty_sales,
"Work Area to hold the sales data
     wa_tab TYPE ty_sales.

SELECT kn~kunnr
       kn~name1
       kv~vkorg
       kv~vtweg
       kv~spart
  FROM knvp as kv
 INNER JOIN kna1 as kn
    on kv~kunnr = kn~kunnr
  INTO TABLE it_tab.

WRITE:/1 'Cutomer',
      15 'Customer_Name',
      55 'Vkorg',
      65 'Vtweg',
      75 'Spart'.
WRITE:/ sy-uline+0(100).
  LOOP AT it_tab INTO wa_tab.
  WRITE:/ wa_tab-Customer,
       15 wa_tab-Customer_Name,
       55 wa_tab-vkorg,
       65 wa_tab-vtweg,
       75 wa_tab-spart.
  ENDLOOP.                             "Loop at it_tab...
