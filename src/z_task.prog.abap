*&---------------------------------------------------------------------*
*& Report Z_TASK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_task.

*DATA: count TYPE i,
*      temp TYPE i,
*      temp1 type i.
*DATA lv_type TYPE vbeln.
*SELECT-OPTIONS Name FOR lv_type.
*
*TYPES: BEGIN OF ty_tab,
*         sales  TYPE vbeln_va,
*         sales1 TYPE vbak-vbeln,
**         value  TYPE posnr,
*       END OF ty_tab.
*
*DATA: it_tab TYPE TABLE OF ty_tab,
*      wa_tab TYPE ty_tab.
*
*SELECT vk~vbeln
*       vb~vbeln
**       vb~posnr
*  FROM vbap AS vb INNER JOIN vbak AS vk ON vb~vbeln = vk~vbeln INTO TABLE it_tab WHERE vb~vbeln IN name.
*
*LOOP AT it_tab INTO wa_tab.
*  temp = wa_tab.
*  count = 0.
*LOOP AT it_tab INTO wa_tab.
*   temp1 = wa_tab.
*
*  If temp = temp1.
*    count = count + 1.
*   WRITE:/ wa_tab-sales,
*            count.
* ELSE.
*   write:/ wa_tab-sales.
*  ENDIF.
*ENDLOOP.
*ENDLOOP.


DATA lv_type TYPE vbap-vbeln.
SELECT-OPTIONS name FOR lv_type.
*SELECT-OPTIONS name1 FOR (vbap-vbeln). " creating select-options without creating data object.
TYPES: BEGIN OF ty_tab,
         vbap  TYPE vbeln_va,
         posnr TYPE posnr,
       END OF ty_tab.
DATA : count  TYPE i,
       temp   TYPE vbap-vbeln,
       it_tab TYPE TABLE OF ty_tab,
       wa_tab TYPE ty_tab.

SELECT vbeln posnr FROM vbap INTO TABLE it_tab WHERE vbeln IN name.

count = 0.

LOOP AT it_tab INTO wa_tab.
  IF sy-tabix <> 1.
    IF temp <> wa_tab-vbap.
      WRITE:/ temp,
              count.
         temp = 0. "CLEAR temp.
         count = 0. "CLEAR count.
      temp = wa_tab-vbap.
      count = count + 1.

    ELSE.
      count = count + 1.
    ENDIF.
  ELSE.
    count = count + 1.
    temp = wa_tab-vbap.
  ENDIF.

ENDLOOP.
