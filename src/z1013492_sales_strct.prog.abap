*&---------------------------------------------------------------------*
*& Include          Z1013492_SALES_STRCT
*&---------------------------------------------------------------------*

TYPE-POOLS: slis.

"Variable to Declare the vbak-erdat
DATA lv_date TYPE vbak-erdat.
SELECT-OPTIONS s_date FOR lv_date.     " Varaible to Hold the erdat Data using Select options

"Structure to hold the sales data
TYPES: BEGIN OF ty_sales_data,
         kunnr TYPE kunnr,
         vbeln TYPE vbeln_va,
         trvog TYPE trvog,
         zmeng TYPE dzmeng,
         zieme TYPE dzieme,
         erdat TYPE vbak-erdat,
         Month TYPE char10,
       END OF ty_sales_data.

DATA:
"Internal Table to Hold the Sales Data
      it_sales_data TYPE TABLE OF ty_sales_data,
"Work Area to Hold the Sales Data
      wa_sales_data TYPE ty_sales_data,
"Varaible to Hold the Month Data
      g_month       TYPE dats,
"Varaible to Hold the Name Of the Month
      g_name        TYPE char20,

"Internal  Table to Hold the Fieldcat
      it_fcat       TYPE slis_t_fieldcat_alv,
"Work Area to Hold the Fieldcat
      wa_fcat       TYPE slis_fieldcat_alv,

"Internal Table to Hold the Listheader
      it_header TYPE slis_t_listheader,
"Work Area to Hold the Listheader
      wa_header TYPE slis_listheader,

      gs_layout TYPE slis_layout_alv.
