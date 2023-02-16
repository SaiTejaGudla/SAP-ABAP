*&---------------------------------------------------------------------*
*& Report Z1013492_AMAZON_SELECTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_AMAZON_SELECTION.

TABLES: sscrfields.
DATA:

      it_custom TYPE TABLE OF Z1013492_TUSER,
      wa_custom TYPE Z1013492_TUSER,

      it_purchase TYPE TABLE OF Z1013492_TORDER,
      wa_purchase TYPE Z1013492_TORDER,

      it_com_det TYPE TABLE OF Z1013492_TADDRES,
      wa_com_det TYPE  Z1013492_TADDRES.

SELECTION-SCREEN BEGIN OF TABBED BLOCK Bk1 for 15 LINES.
SELECTION-SCREEN TAB (30) Tab1 USER-COMMAND UC1.
SELECTION-SCREEN TAB (30) Tab2 USER-COMMAND UC2.
SELECTION-SCREEN TAB (30) Tab3 USER-COMMAND UC3.
SELECTION-SCREEN END OF BLOCK Bk1.

SELECTION-SCREEN BEGIN OF SCREEN 200 as SUBSCREEN.
  SELECTION-SCREEN COMMENT 1(20) Com1.
  PARAMETERS : P_USER    TYPE Z1013492_DE_USERID,
               P_MAIL    TYPE Z1013492_DE_MAIL_ID,
               P_F_NAME  TYPE Z1013492_DE_F_NAME,
               P_M_NAME  TYPE Z1013492_DE_M_NAME,
               P_L_NAME  TYPE Z1013492_DE_L_NAME,
               P_DOB     TYPE Z1013492_DE_DOB.
  SELECTION-SCREEN END OF SCREEN 200.


SELECTION-SCREEN BEGIN OF SCREEN 100 as SUBSCREEN.
 SELECTION-SCREEN COMMENT 1(20) Com2.
  PARAMETERS: P_ORDER   TYPE Z1013492_DE_ORDER_ID,
              P_PRD_ID  TYPE Z1013492_DE_PRODUCT_ID,
              P_QUANT   TYPE Z1013492_DE_ORDER_QUANT,
              P_PRICE   TYPE Z1013492_DE_ORDR_PRICE,
              P_PAY     TYPE Z1013492_DE_PAYMENT_TYPE,
              P_DATE    TYPE Z1013492_DE_ORDER_DATE,
              P_TIME    TYPE Z1013492_DE_ORDER_TIME.

  SELECTION-SCREEN END OF SCREEN 100.

SELECTION-SCREEN BEGIN OF SCREEN 150 AS SUBSCREEN.
 SELECTION-SCREEN COMMENT 1(20) Com3.
 PARAMETERS: P_ADDRES  TYPE Z1013492_DE_ADDRESS_ID,
             P_STREET  TYPE Z1013492_DE_STREET_NAME,
             P_DOOR TYPE Z1013492_DE_DOOR_NO,
             P_AREA    TYPE Z1013492_DE_AREA,
             P_DSTRCT  TYPE Z1013492_DE_DISTRICT,
             P_STATE   TYPE Z1013492_DE_STATE,
             P_PINCOD  TYPE Z1013492_DE_PINCODE.
 SELECTION-SCREEN END OF SCREEN 150.

 SELECTION-SCREEN BEGIN OF LINE.
 SELECTION-SCREEN PUSHBUTTON: 22(8) p_Append USER-COMMAND click1,
                              40(8) p_Delete USER-COMMAND click2.
SELECTION-SCREEN END OF LINE.

INITIALIZATION.
 Bk1-dynnr = '200'.
 Bk1-activetab = 'UC1'.
 Bk1-prog  = sy-repid.

 TAB1 = ' General Data'.
 TAB2 = 'Purchase Details'.
 TAB3 = 'Communication Details'.

 Com1 = ' Customer Data:-'.
 Com2 = ' Address Details:-'.
 Com3 = ' Order Details:-'.

 p_append = 'Append'.
 p_delete = 'Delete'.

AT SELECTION-SCREEN OUTPUT.

  wa_custom-user_id = p_user.
  wa_custom-mail_id = p_mail.
  wa_custom-f_name  = p_f_name.
  wa_custom-m_name  = p_m_name.
  wa_custom-l_name  = p_l_name.
  wa_custom-DOB     = p_dob.


  wa_purchase-ORDER_ID   = p_order.
  wa_purchase-product_ID = p_prd_id.
  wa_purchase-ORDER_QUANT = p_quant.
  wa_purchase-ordr_price  = p_price.
  wa_purchase-PAYMENT_TYPE = p_pay.
  wa_purchase-order_date   = p_date.
  wa_purchase-order_time    = p_time.


  wa_com_det-address_id = p_addres.
  wa_com_det-street_name = p_street.
  wa_com_det-door_no    = p_door.
  wa_com_det-area       = p_area.
  wa_com_det-district   = p_dstrct.
  wa_com_det-state      = p_state.
  wa_com_det-pincode    = p_pincod.

 AT SELECTION-SCREEN.
   CASE sy-ucomm.
     WHEN 'UC1'.
        Bk1-dynnr = '200'.
        Bk1-activetab = 'UC1'.
        Bk1-prog  = sy-repid.
     WHEN 'UC2'.
        Bk1-dynnr = '100'.
        Bk1-activetab = 'UC2'.
        Bk1-prog  = sy-repid.
     WHEN 'UC3'.
        Bk1-dynnr = '150'.
        Bk1-activetab = 'UC3'.
        Bk1-prog  = sy-repid.
    ENDCASE.

  CASE sscrfields-ucomm.
    when 'CLICK1'.

        INSERT Z1013492_tuser   FROM wa_custom.
        INSERT Z1013492_torder  FROM wa_purchase.
        INSERT Z1013492_taddres FROM wa_com_det.


    WHEN 'CLICK2'.

      DELETE FROM Z1013492_tuser   WHERE user_id = p_user.
      DELETE FROM Z1013492_torder  WHERE order_id = p_order.
      DELETE FROM Z1013492_taddres WHERE address_id = p_addres.

   ENDCASE.
