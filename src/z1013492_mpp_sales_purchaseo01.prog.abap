*----------------------------------------------------------------------*
***INCLUDE Z1013492_MPP_SALES_PURCHASEO01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS 'Z1013492_PF'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
CASE SY-UCOMM.
    WHEN 'CANCEL' OR 'BACK' OR 'E1'.
      LEAVE PROGRAM.
  ENDCASE.                             "Case sy-ucomm...
  IF RB1 = 'X'.
    G_SCREEN = 50.
    CASE sy-ucomm.
      WHEN 'FD1'.
         PERFORM get_PURCHASE.
         CALL SCREEN 200.
    ENDCASE.                           "Case sy-ucomm...

  ELSEIF RB2 = 'X'.
    G_SCREEN = 80.
    CASE sy-ucomm.
      WHEN 'FD1'.
        PERFORM get_sales.
          CALL SCREEN 155.
    ENDCASE.                           "Case sy-ucomm...

  ENDIF.                               "If RB1...

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_sales
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_sales .

  CLEAR: wa_Sales,
         wa_final_Sales.

  REFRESH: it_sales,
           it_final_sales.

SELECT VK~VBELN
       VK~ERDAT
       VK~ERNAM
       VK~VBTYP
       VK~VKORG
       VK~AUDAT
       VK~NETWR
       VP~POSNR
       VP~MATNR
       VP~ZWERT
       VP~ZMENG
       VP~ZIEME
       MT~MAKTX
  INTO TABLE IT_final_SALES
  FROM VBAK AS VK
 INNER JOIN VBAP AS VP
    ON VK~VBELN = VP~VBELN
 INNER JOIN MAKT AS MT
    ON VP~MATNR = MT~MATNR
 WHERE VK~VBELN IN S_VBELN
   AND VP~POSNR IN S_POSNR
   AND VK~AUDAT IN S_AUDAT
   AND VP~ERNAM IN S_ERNA
   AND spras = 'E'.

  IF sy-subrc = 0 AND it_final_sales IS NOT INITIAL.
    SORT it_final_sales by vbeln.
  ELSE.
    MESSAGE 'DATA NOT FETCHED' TYPE 'I'.
  ENDIF.                               "If sy-subrc...

  LOOP AT it_final_sales INTO wa_final_sales.
    AT NEW vbeln.
      wa_Sales-vbeln = wa_final_sales-vbeln.
    ENDAT.
      wa_sales-erdat = wa_final_Sales-erdat.
      wa_sales-ernam = wa_final_Sales-ernam.
      wa_sales-vbtyp = wa_final_Sales-vbtyp.
      wa_sales-vkorg = wa_final_Sales-vkorg.
      wa_sales-audat = wa_final_Sales-audat.
      wa_sales-netwr = wa_final_Sales-netwr.
      wa_sales-posnr = wa_final_Sales-posnr.
      wa_sales-matnr = wa_final_Sales-matnr.
      wa_sales-zwert = wa_final_Sales-zwert.
      wa_sales-zmeng = wa_final_Sales-zmeng.
      wa_sales-zieme = wa_final_Sales-zieme.
      wa_sales-maktx = wa_final_Sales-maktx.
     APPEND wa_sales to it_sales.
     CLEAR wa_sales.

   AT END OF VBELN.
     SUM.
     wa_sales-netwr = wa_final_sales-netwr.
     wa_sales-zmeng = wa_final_sales-zmeng.
     APPEND wa_Sales to it_sales.
   ENDAT.
  ENDLOOP.                             "Loop at it_final...
ENDFORM.
*&---------------------------------------------------------------------*
*& Module HIDE_DISPLAY OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE hide_display OUTPUT.
*LOOP AT SCREEN.
*  IF RB1 = 'X' .
*    G_SCREEN = 80.
*  ELSEIF RB2 = 'X'.
*    G_SCREEN = 50.
*  ENDIF.
*ENDLOOP.



ENDMODULE.
*&---------------------------------------------------------------------*
*& Form get_PURCHASE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_PURCHASE .


  CLEAR: wa_purchase.


  REFRESH:it_purchase.


SELECT EK~EBELN
       EK~BUKRS
       EK~BSTYP
       EK~STATU
       EK~AEDAT
       EK~ERNAM
       EP~EBELP
       EP~MATNR
       MK~MAKTX
       EP~WERKS
       EP~LGORT
       EP~MENGE
       EP~MEINS

  INTO TABLE IT_PURCHASE
  FROM EKKO AS EK
 INNER JOIN EKPO AS EP
    ON EK~EBELN = EP~EBELN
 INNER JOIN MAKT AS MK
    ON EP~MATNR = MK~MATNR
 WHERE EK~EBELN IN S_EBELN.
*   AND EP~EBELP IN S_EBELP
*   AND EK~AEDAT IN S_AEDAT
*   AND EK~ERNAM IN S_ERNAM
*   AND mk~spras = 'E'.

ENDFORM.
