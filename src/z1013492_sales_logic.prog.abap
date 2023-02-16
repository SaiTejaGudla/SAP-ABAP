*&---------------------------------------------------------------------*
*& Include          Z1013492_SALES_LOGIC
*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .

  SELECT vk~kunnr
       vk~vbeln
       vk~trvog
       vp~zmeng
       vp~zieme
       vk~erdat
  FROM vbak AS vk
 INNER JOIN vbap AS vp
    ON vk~vbeln = vp~vbeln
  INTO TABLE it_sales_data
 WHERE vk~erdat IN s_date.
SORT it_sales_data ASCENDING BY erdat.

LOOP AT it_sales_data INTO wa_sales_data.

  g_month = wa_sales_data-erdat+4(2).

IF  g_month = '01'.
  g_name = 'January'.
ELSEIF g_month = '02'.
  g_name = 'February'.
ELSEIF g_month = '03'.
  g_name = 'March'.
ELSEIF g_month = '04'.
  g_name = 'April'.
ELSEIF g_month = '05'.
  g_name = 'May'.
ELSEIF g_month = '06'.
  g_name = 'June'.
ELSEIF g_month = '07'.
  g_name = 'July'.
ELSEIF g_month = '08'.
  g_name = 'August'.
ELSEIF g_month = '09'.
  g_name = 'September'.
ELSEIF g_month = '10'.
  g_name = 'October'.
ELSEIF g_month = '11'.
  g_name = 'November'.
ELSEIF g_month = '12'.
  g_name = 'December'.
ENDIF.                                 "If g_month...

on CHANGE OF g_name.
wa_sales_data-month = g_name.
MODIFY it_sales_data FROM wa_sales_data.
endon.

ENDLOOP.                               "Loop at it_sales_data...


ENDFORM.

*&---------------------------------------------------------------------*
*& Form Fieldcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM Fieldcat .

wa_fcat-fieldname = 'KUNNR'.
wa_fcat-col_pos   = 1.
wa_fcat-seltext_m = 'Customer Number'.
APPEND wa_fcat TO it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'VBELN'.
wa_fcat-col_pos   = 2.
wa_fcat-seltext_m = 'Customer Number'.
APPEND wa_fcat TO it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'TRVOG'.
wa_fcat-col_pos   = 3.
wa_fcat-seltext_m = 'Order Type'.
APPEND wa_fcat TO it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'ZMENG'.
wa_fcat-col_pos   = 4.
wa_fcat-seltext_m = 'Quantity'.
APPEND wa_fcat TO it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'ZIEME'.
wa_fcat-col_pos   = 5.
wa_fcat-seltext_m = 'Unit Of Measure'.
APPEND wa_fcat TO it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'ERDAT'.
wa_fcat-col_pos   = 6.
wa_fcat-seltext_m = 'Date'.
APPEND wa_fcat TO it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'MONTH'.
wa_fcat-col_pos   = 7.
wa_fcat-seltext_m = 'Month'.
APPEND wa_fcat TO it_fcat.
CLEAR wa_fcat.

gs_layout-colwidth_optimize = 'X'.
gs_layout-zebra = 'X'.

ENDFORM.
