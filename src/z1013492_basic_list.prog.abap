*&---------------------------------------------------------------------*
*& Report Z1013492_BASIC_LIST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_basic_list.
TYPES:
"Structure For customer Details
       BEGIN OF ty_custom,
         customer_id TYPE z1013492_de_customer_id,
         account_no  TYPE z1013492_de_account_no,
         cust_f_name TYPE z1013492_de_cust_f_name,
         cust_l_name TYPE z1013492_de_cust_l_name,
       END OF ty_custom,

"Structure for Transaction Details
       BEGIN OF ty_transac,
         transaction_id TYPE z1013492_transaction_id,
         customer_id    TYPE z1013492_customer_id,
         trans_date     TYPE z1013492_de_trans_date,
         trans_time     TYPE z1013492_de_trans_time,
       END OF ty_transac.

DATA:
"Internal table to store customer details
      it_custom  TYPE TABLE OF ty_custom,
"Internal Table to store transaction Details
      it_transac TYPE TABLE OF ty_transac,
"Work Area to store customer Details
      wa_custom  TYPE ty_custom,
"Work area to store transaction Details
      wa_transac TYPE ty_transac,
"Variable for transaction id
      g_tranid   TYPE z1013492_transaction_id,
"Variable to store transaction id
      g_value    TYPE z1013492_customer_id,
"Variable to store transaction id
      g_field    TYPE z1013492_customer_id.

SELECTION-SCREEN BEGIN OF BLOCK blk1 WITH FRAME.
  SELECTION-SCREEN COMMENT 5(20) com1.
    PARAMETERS :
"Parameters for transaction id
                p_tranid TYPE z1013492_transaction_id.
SELECTION-SCREEN END OF BLOCK bLK1.

AT SELECTION-SCREEN ON p_tranid.
  SELECT SINGLE transaction_id FROM z1013492_t_trans INTO g_tranid WHERE transaction_id = p_tranid.
  IF sy-subrc <> 0.
    MESSAGE 'Enter Valid Transaction Id' TYPE 'E'.
  ENDIF.                               "if sy-subrc = 0

INITIALIZATION.
  com1 = 'Transaction Details'.

START-OF-SELECTION.

  SELECT  transaction_id
          customer_id
          trans_date
          trans_time
    FROM z1013492_t_trans INTO TABLE it_transac
   WHERE transaction_id = p_tranid.

 WRITE:/ sy-uline+0(50).
  WRITE:/1 sy-vline,
         2 'Transaction Id', 15 sy-vline,
         16 'Customer Id',   29 sy-vline,
         30 'Date',          40 sy-vline,
         41 'Time',          50 sy-vline.
  WRITE:/ sy-uline+0(50).
  IF sy-subrc = 0.
    LOOP AT it_transac INTO wa_transac.

      WRITE :/1 sy-vline,
              2 wa_transac-transaction_id, 15 sy-vline,
             16 wa_transac-customer_id,    29 sy-vline,
             30 wa_transac-TRANS_date,     40 sy-vline,
             41 wa_transac-TRANS_time,     50 sy-vline,
            / sy-uline+0(50).
    ENDLOOP.
  ENDIF.

AT LINE-SELECTION.

  GET CURSOR FIELD g_field VALUE g_value.


  SELECT customer_id
         account_no
         cust_f_name
         cust_l_name
    FROM z1013492_taccde INTO TABLE it_custom
   WHERE customer_id = g_value.
  IF sy-subrc = 0.
    WRITE:/ sy-uline(55).

    wRITE:/ sy-vline,
           3 'Customer Id', 15 sy-vline,
          16 'Account No',  28 sy-vline,
          29 'F Name',      40 sy-vline,
          41 'L Name',      55 sy-vline.
    WRITE:/ sy-uline+0(55).
    CASE sy-lsind.
      WHEN 1.
        LOOP AT it_custom INTO wa_custom.
          WRITE :/1 sy-vline,
                  2 wa_custom-customer_id, 15 sy-vline,
                 16 wa_custom-account_no,  28 sy-vline,
                 29 wa_custom-cust_f_name, 40 sy-vline,
                 41 wa_custom-cust_f_name, 55 sy-vline,
               / sy-uline+0(55).
        ENDLOOP.

    ENDCASE.
  ENDIF.
