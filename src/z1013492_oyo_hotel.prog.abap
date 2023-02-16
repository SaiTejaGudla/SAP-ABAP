*&---------------------------------------------------------------------*
*& Report Z1013492_OYO_HOTEL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_oyo_hotel.

TABLES:sscrfields.

TYPES: BEGIN OF ty_srch,
         hotel_id TYPE z1013492_de_hotel_id,
         name     TYPE z1013492_DE_hotel_name,
         contact  TYPE z1013492_o_hotel-contact_no,
         room_no  TYPE z1013492_DE_room_no,
       END OF ty_srch.

DATA : it_room   TYPE TABLE OF z1013492_o_book,
       wa_room   TYPE z1013492_o_book,
       it_search TYPE TABLE OF ty_srch,
       wa_search TYPE ty_srch,
       g_hotel   TYPE z1013492_de_hotel_id.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(30) c1.
  PARAMETERS: p_book  RADIOBUTTON GROUP g1 USER-COMMAND uc1,
              p_b_no  TYPE z1013492_de_bill_no MODIF ID md1,
              p_hotel TYPE z1013492_de_hotel_id MODIF ID md1,
              p_room  TYPE z1013492_de_room_no MODIF ID md1,
              p_cust  TYPE z1013492_de_customer_id MODIF ID md1,
              p_chin  TYPE z1013492_de_checkin_date MODIF ID md1,
              p_chout TYPE z1013492_de_checkout_date MODIF ID md1,
              p_id    TYPE z1013492_de_id_proof MODIF ID md1,
              p_bill  TYPE z1013492_de_bill_price MODIF ID md1.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON: 2(20) p_con USER-COMMAND click1.
  SELECTION-SCREEN END OF LINE.
  PARAMETERS : p_cancel RADIOBUTTON GROUP g1,
               p_billn  TYPE z1013492_de_bill_no MODIF ID md2.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON: 2(20) p_can USER-COMMAND click2.
  SELECTION-SCREEN END OF LINE.

  PARAMETERS: p_mngr RADIOBUTTON GROUP g1 DEFAULT 'X',
              p_hot  TYPE z1013492_de_hotel_id MODIF ID md3.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON: 2(20) p_search USER-COMMAND click3.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK b1.

AT SELECTION-SCREEN OUTPUT.
**    IF p_book = 'X'.
*  LOOP AT SCREEN.
*    IF p_book = 'X'.
*      if screen-group1 = 'MD1'.
*      screen-active = 1.
*      MODIFY SCREEN.
*   ELSEIF screen-group1 = 'MD2'.
*          SCREEN-ACTIVE = 0.
*          MODIFY SCREEN.
*   ELSEIF SCREEN-GROUP1 = 'MD3'.
*          SCREEN-ACTIVE = 0.
*          MODIFY SCREEN.
*   ENDIF.
*   ENDLOOP.
*
* ELSEIF P_CANCEL = 'X'.
*   LOOP AT SCREEN.
* IF SCREEN-GROUP1 = 'MD1'.
*     SCREEN-ACTIVE = 0.
*     MODIFY SCREEN.
*  ELSEIF SCREEN-GROUP1 = 'MD2'.
*         SCREEN-ACTIVE = 1.
*     MODIFY SCREEN.
*  ELSEIF SCREEN-GROUP1 = 'MD3'.
*         SCREEN-ACTIVE = 0.
*     MODIFY SCREEN.
*    ENDIF.
*    ENDLOOP.
*
*
*     ELSEIF P_MNGR = 'X'.
*   LOOP AT SCREEN.
* IF SCREEN-GROUP1 = 'MD1'.
*     SCREEN-ACTIVE = 0.
*     MODIFY SCREEN.
*  ELSEIF SCREEN-GROUP1 = 'MD2'.
*         SCREEN-ACTIVE = 0.
*     MODIFY SCREEN.
*  ELSEIF SCREEN-GROUP1 = 'MD3'.
*         SCREEN-ACTIVE = 1.
*     MODIFY SCREEN.
*    ENDIF.

  LOOP AT SCREEN.
    IF p_book = 'X' AND screen-group1 = 'MD1'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_book = '' AND screen-group1 = 'MD1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_cancel = 'X' AND screen-group1 = 'MD2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_cancel = '' AND screen-group1 = 'MD2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_mngr = 'X' AND screen-group1 = 'MD3'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_mngr = '' AND screen-group1 = 'MD3'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.
  ENDLOOP.

INITIALIZATION.
  t1 = ' OYO SELECTION SCREEN'.
  c1 = ' SELECT THE OPERATION'.
  p_con = 'CONFIRM BOOKING'.
  p_can = ' CANCEL BOOKING'.
  p_search  = 'SEARCH ROOMS'.


 AT SELECTION-SCREEN.
  CASE sscrfields-ucomm.
    WHEN 'CLICK1'.

      wa_room-billing_no    = p_b_no.
      wa_room-hotel_id      = p_hotel.
      wa_room-room_no       = p_room.
      wa_room-customer_id   = p_cust.
      wa_room-checkin_date  = p_chin.
      wa_room-checkout_date = p_chout.
      wa_room-id_proof      = p_id.

      INSERT z1013492_o_book FROM wa_room.


    WHEN 'CLICK2'.

      DELETE FROM z1013492_o_book WHERE billing_no = p_billn.
      UPDATE z1013492_o_book FROM wa_room.

    WHEN 'CLICK3'.

 SELECT h~hotel_id
        h~hotel_name
        h~contact_no
        r~room_no
  FROM z1013492_o_hotel AS h
 INNER JOIN z1013492_o_room AS r
    ON  h~hotel_id = r~hotel_id
  INTO TABLE it_search
 WHERE h~hotel_id = p_hot.

*   LOOP AT it_search INTO wa_search.
*        WRITE:/ wa_search-hotel_id,
*                wa_search-name,
*                wa_search-contact,
*                wa_search-room_no.
*      ENDLOOP.

  ENDCASE.

  START-OF-SELECTION.

   LOOP AT it_search INTO wa_search.
        WRITE:/ wa_search-hotel_id,
                wa_search-name,
                wa_search-contact,
                wa_search-room_no.
      ENDLOOP.
