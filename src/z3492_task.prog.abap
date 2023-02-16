*&---------------------------------------------------------------------*
*& Report Z3492_TASK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z3492_TASK.
*
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
         count = 0. "CLEAR count.
      temp = wa_tab-vbap.
      count = count + 1.

    ELSE.
      count = count + 1.

    ENDIF.
  ELSE.
    temp = wa_tab-vbap.
    count = count + 1.
  ENDIF.

ENDLOOP.

*PARAMETERS name type string.
*write name.
