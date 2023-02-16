*&---------------------------------------------------------------------*
*& Report Z1013492_HOTEL_STOCK_SALES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_hotel_stock_sales.

DATA:
  " Intenral table for storing the transaction data
  it_sales TYPE TABLE OF z1013492_h_trans,
  " Work area for storing the transaction data
  wa_sales TYPE          z1013492_h_trans,

  "Internal table for storing the stock data
  it_stock TYPE TABLE OF z1013492_h_stock,
  "Work area for storing the stock data
  wa_stock TYPE          z1013492_h_stock.

SELECTION-SCREEN BEGIN OF BLOCK bk1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 1(40) com1.
  PARAMETERS:
    "variable for sales as radiobutton
    p_sales RADIOBUTTON GROUP rad1 USER-COMMAND u1,
    "Variables for branches as checkboxes...
    p_chk1  AS CHECKBOX MODIF ID md1,
    p_chk2  AS CHECKBOX MODIF ID md1,
    p_chk3  AS CHECKBOX MODIF ID md1,
    p_chk4  AS CHECKBOX MODIF ID md1,

    "Variable for stock as radiobutton
    p_stock RADIOBUTTON GROUP rad1,
    p_chk5  AS CHECKBOX MODIF ID md2,
    p_chk6  AS CHECKBOX MODIF ID md2,
    p_chk7  AS CHECKBOX MODIF ID md2,
    p_chk8  AS CHECKBOX MODIF ID md2 DEFAULT 'X'.

*    p_none  RADIOBUTTON GROUP rad1 DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK bk1.

INITIALIZATION.
  t1   = 'SALES AND STOCKS DETAILS'.
  com1 = 'RADIO BUTTONS FOR SALES AND STOCKS'.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF p_sales EQ 'X' AND screen-group1 = 'MD1'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_sales EQ ' ' AND screen-group1 = 'MD1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_stock EQ 'X' AND screen-group1 = 'MD2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_stock EQ ' ' AND screen-group1 = 'MD2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.                               "If p_sales...
  ENDLOOP.                               "Loop at screen...

START-OF-SELECTION.
  IF p_sales = 'X'.
    IF p_chk1 EQ 'X' AND P_chk2 EQ 'X' AND p_chk3 EQ 'X' AND p_chk4 EQ 'X'.
      SELECT * FROM z1013492_h_trans INTO TABLE it_sales
       WHERE hotel_id EQ 'H4376411' OR
             hotel_id EQ 'H7823187' OR
             hotel_id EQ 'H9173923' OR
             hotel_id EQ 'H4732687'.

    ELSEIF p_chk1 EQ 'X' AND P_chk2 EQ 'X' AND p_chk3 EQ 'X'.

      SELECT * FROM z1013492_h_trans INTO TABLE it_sales
       WHERE hotel_id EQ 'H4376411' OR
             hotel_id EQ 'H7823187' OR
             hotel_id EQ 'H9173923'.

    ELSEIF  p_chk1 EQ 'X' AND P_chk2 EQ 'X'.

      SELECT * FROM z1013492_h_trans INTO TABLE it_sales
       WHERE hotel_id EQ 'H4376411' OR
             hotel_id EQ 'H7823187'.

    ELSEIF p_chk1 EQ 'X'.

      SELECT * FROM z1013492_h_trans INTO TABLE it_sales
        WHERE hotel_id EQ 'H4376411'.

    ELSEIF p_chk2 EQ 'X'.

      SELECT * FROM z1013492_h_trans INTO TABLE it_sales
        WHERE hotel_id EQ 'H7823187'.


    ELSEIF p_chk3 EQ 'X'.

      SELECT * FROM z1013492_h_trans INTO TABLE it_sales
        WHERE hotel_id EQ 'H9173923'.


    ELSEIF p_chk4 EQ 'X'.

      SELECT * FROM z1013492_h_trans INTO TABLE it_sales
        WHERE hotel_id EQ 'H4732687'.

    ELSE.

      MESSAGE 'SELECT CHECK BOX' TYPE 'E'.
    ENDIF.                               "IF p_chk1...
  ENDIF.                               "If p_sales...

  IF p_stock = 'X'.

    IF p_chk5 EQ 'X' AND P_chk6 EQ 'X' AND p_chk7 EQ 'X' AND P_chk8 EQ 'x'.
      SELECT * FROM z1013492_h_stock INTO TABLE it_stock
       WHERE hotel_id EQ 'H4376411' OR
             hotel_id EQ 'H7823187' OR
             hotel_id EQ 'H9173923' OR
             hotel_id EQ 'H4732687'.

    ELSEIF p_chk5 EQ 'X' AND P_chk6 EQ 'X' AND p_chk7 EQ 'X'.
      SELECT * FROM z1013492_h_stock INTO TABLE it_stock
       WHERE hotel_id EQ 'H4376411' OR
             hotel_id EQ 'H7823187' OR
             hotel_id EQ 'H9173923'.

    ELSEIF  p_chk5 EQ 'X' AND P_chk6 EQ 'X'.

      SELECT * FROM z1013492_h_stock INTO TABLE it_stock
       WHERE hotel_id EQ 'H4376411' OR
             hotel_id EQ 'H7823187'.

    ELSEIF p_chk5 EQ 'X'.

      SELECT * FROM z1013492_h_stock INTO TABLE it_stock
        WHERE hotel_id EQ 'H4376411'.

    ELSEIF p_chk6 EQ 'X'.

      SELECT * FROM z1013492_h_stock INTO TABLE it_stock
       WHERE hotel_id EQ 'H7823187'.

    ELSEIF p_chk7 EQ 'X'.

      SELECT * FROM z1013492_h_stock INTO TABLE it_stock
       WHERE hotel_id EQ 'H9173923'.

    ELSEIF p_chk8 EQ 'X'.

      SELECT * FROM z1013492_h_stock INTO TABLE it_stock
       WHERE hotel_id EQ 'H4732687'.

    ELSE.
      MESSAGE 'SELECT CHECK BOX' TYPE 'E'.

    ENDIF.                               "If p_chk5...
  ENDIF.                               "If p_stock...

  IF sy-subrc = 0.

    CASE 'X'.

      WHEN p_sales.

        WRITE: sy-uline+0(97).

        WRITE:/1 sy-vline,
               2 'TRANS ID',    12 sy-vline,
              13 'HOTEL ID',    22 sy-vline,
              23 'ORDER ID',    34 sy-vline,
              35 'CUSTOMER ID', 46 sy-vline,
              47 'PAYMENT TYPE',59 sy-vline,
              60 'TOT PRICE',   72 sy-vline,
              73 'DATE',        85 sy-vline,
              87 'TIME',        97 sy-vline.
        WRITE:/ sy-uline+0(97).

        LOOP AT it_sales INTO wa_sales.

          WRITE:/1 sy-vline,
                 2 wa_sales-transaction_id, 12 sy-vline,
                14  wa_sales-hotel_id,      22 sy-vline,
                23  wa_sales-order_id,      34 sy-vline,
                36  wa_sales-customer_id,   46 sy-vline,
                49  wa_sales-payment_type,  59 sy-vline,
                60  wa_sales-tot_price,     72 sy-vline,
                74  wa_sales-trans_date,    85 sy-vline,
                88  wa_sales-trans_time,    97 sy-vline.
          WRITE:/ sy-uline+0(97).
        ENDLOOP.                          "Loop at it_sales...

      WHEN p_stock.

        WRITE:sy-uline(53).
        WRITE:/1 sy-vline,
               2 'HOTEL ID',    10 sy-vline,
              12 'ITEM ID',     20 sy-vline,
              22 'ITEM NAME',   40 sy-vline,
              42 'AVAIL STOCK', 53 sy-vline.
        WRITE:/ sy-uline(53).
        LOOP AT it_stock INTO wa_stock.

          WRITE:/1 sy-vline,
                 3 wa_stock-hotel_id,   10 sy-vline,
                12 wa_stock-item_id,    20 sy-vline,
                22 wa_stock-item_name,  40 sy-vline,
                42 wa_stock-avail_stock,53 sy-vline.
          WRITE:/ sy-uline(53).
        ENDLOOP.                          "Loop at it_stock...
    ENDCASE.                           "Case 'X'...
  ENDIF.                                "If sy-subrc=0
