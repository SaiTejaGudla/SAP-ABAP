*&---------------------------------------------------------------------*
*& Report Z1013492_MPP_AMAZON_DET
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MPP_AMAZON_DET.

 TYPES:
 "Structure for Holding the user details
      BEGIN OF ts_z1013492_tuser,
        MANDT      TYPE CHAR3,
        user_id    TYPE z1013492_tuser-user_id,
        mail_id    TYPE z1013492_tuser-mail_id,
        f_name     TYPE z1013492_tuser-f_name,
        m_name     TYPE z1013492_tuser-m_name,
        l_name     TYPE z1013492_tuser-l_name,
        dob        TYPE z1013492_tuser-dob,
        contact    TYPE z1013492_tuser-contact,
        address_id TYPE z1013492_tuser-address_id,
      END OF ts_z1013492_tuser,

"Structure for holding the address details
       BEGIN OF ts_z1013492_taddres,
              MANDT       TYPE MANDT,
              address_id  TYPE z1013492_taddres-address_id,
              street_name TYPE z1013492_taddres-street_name,
              door_no     TYPE z1013492_taddres-door_no,
              area        TYPE z1013492_taddres-area,
              district    TYPE z1013492_taddres-district,
              state       TYPE z1013492_taddres-state,
              country     TYPE z1013492_taddres-country,
              pincode     TYPE z1013492_taddres-pincode,
      END OF ts_z1013492_taddres,

"Struture for holding the order Details
       BEGIN OF ts_z1013492_torder,
              MANDT        TYPE MANDT,
              order_id     TYPE z1013492_torder-order_id,
              product_id   TYPE z1013492_torder-product_id,
              address_id   TYPE z1013492_torder-address_id,
              user_id      TYPE z1013492_torder-user_id,
              order_quant  TYPE z1013492_torder-order_quant,
              ordr_price   TYPE z1013492_torder-ordr_price,
              payment_type TYPE z1013492_torder-payment_type,
              order_date   TYPE z1013492_torder-order_date,
              order_time   TYPE z1013492_torder-order_time,
       END OF ts_z1013492_torder.

 DATA:
"Internal Table for holding the ts_z1013492_tuser
       it_cust TYPE TABLE OF ts_z1013492_tuser,
"Work Area for Holding the ts_z1013492_tuser
       wa_cust TYPE ts_z1013492_tuser,

"Internal Table for Holding the ts_z1013492_taddress
       it_address TYPE TABLE OF ts_z1013492_taddres,
"Work area for Holding the ts_z1013492_taddress
       wa_address TYPE ts_z1013492_taddres,

"Internal Table for Holding the ts_z1013492_torder
       it_order TYPE TABLE OF ts_z1013492_torder,
"Work area for Holding the ts_z1013492_torder
       wa_order TYPE ts_z1013492_torder,

"Internal Table For Holding the Product Details
       IT_PRDET TYPE TABLE OF z1013492_tprdet,
"Work Area for Holding the PRoduct Details
       wa_prdet TYPE z1013492_tprdet,

"Global Variable for Holding the Order id
       G_order_id TYPE z1013492_torder-order_id,
"Global Variable for Holding the Product id
       g_prd_id TYPE z1013492_tprdet-product_id,

"Variable for capturing the value of Product id
       G_VAL TYPE Z1013492_TORDER-PRODUCT_ID,
"Varaible for capturing the field of Product id
       G_FLD TYPE Z1013492_TORDER-PRODUCT_ID,

"Variable for Holding the System Variable
       G_SCREEN TYPE SY-DYNNR,

       RB1,
       RB2.

SELECTION-SCREEN BEGIN OF SCREEN 50 AS SUBSCREEN.
*
  SELECT-OPTIONS:
 "Varaible to Hold the Prodcut Id as Select Options
                  S_PRD_ID FOR G_PRD_ID,
 "Varaible to Hold the order Id as Select Options
                  S_ORD_ID FOR G_ORDER_ID.
SELECTION-SCREEN END OF SCREEN 50.

G_SCREEN = 50.

CALL SCREEN: 100,
             104,                       "Subscreen for Personal Details
             105,                       "Subscreen for Communication Details
             106.                       "Subscreen for Order Details

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
CASE sy-ucomm.
  WHEN 'E1' OR 'CANCEL' OR 'BACK'.
      LEAVE PROGRAM.
  WHEN 'I1'.
    PERFORM INSERT.
  WHEN 'D1'.
    PERFORM DELETE.
  WHEN 'DIS'.
    PERFORM get_cust.
  WHEN 'FC1'.
    CAll SCREEN 200.
ENDCASE.                               "Case sy-ucomm...

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form INSERT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM insert .
INSERT z1013492_tuser   FROM WA_CUST.
INSERT z1013492_tADDRES FROM WA_ADDRESS.
INSERT z1013492_torder  FROM WA_order.
IF sy-subrc = 0.
  MESSAGE 'Data Insertion Successful' TYPE 'I'.
ELSE.
  MESSAGE 'Data Insertion Not Successful' TYPE 'I'.
ENDIF.                                 "If sy-subrc...

ENDFORM.
*&---------------------------------------------------------------------*
*& Form DELETE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM delete .
DELETE FROM z1013492_tuser WHERE USER_ID = WA_CUST-USER_ID.
DELETE FROM z1013492_tADDRES WHERE ADDRESS_ID = WA_CUST-ADDRESS_ID.
DELETE FROM z1013492_TORDer WHERE ORDER_ID = WA_ORDER-ORDER_ID.
IF SY-SUBRC = 0.
  MESSAGE 'Data Deletion Successful' TYPE 'I'.
ELSE.
  MESSAGE 'Data Deleteion Not Successful' TYPE 'I'.
ENDIF.                                 "If sy-subrc...

ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .
  IF s_ord_id = wa_order-order_id.
    SELECT * FROM z1013492_torder
      INTO TABLE it_order
     WHERE order_id in s_ord_id.
  ELSEIF s_prd_id = wa_prdet-product_id.
    SELECT * FROM z1013492_tprdet
      INTO TABLE it_prdet
     WHERE product_id in s_prd_id.
  ENDIF.                               "If s_ord_id...

ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_cust
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_cust .

  SELECT SINGLE * FROM z1013492_tuser
    INTO wa_cust
   WHERE user_id = wa_cust-user_id.

     SELECT SINGLE * FROM z1013492_taddres
      INTO wa_address
     WHERE address_id = wa_cust-address_id.

   SELECT SINGLE * FROM z1013492_torder
       INTO wa_order
      WHERE user_id = wa_cust-user_id.

*ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'Z1013492_PF'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  CASE SY-UCOMM.
    WHEN 'DSP'.
      SELECT * FROM Z1013492_TORDER
        INTO TABLE IT_ORDER
       WHERE ORDER_ID IN S_ORD_ID.
    WHEN 'CANCEL' OR 'BACK' OR 'E2'.
      LEAVE PROGRAM.
    WHEN 'CHOOSE'.
      GET CURSOR FIELD G_FLD VALUE G_VAL.
      SELECT * FROM Z1013492_TPRDET
        INTO TABLE IT_PRDET
       WHERE PRODUCT_ID = G_VAL.
        CALL SCREEN 300.
  ENDCASE.                             "Case sy-ucomm...
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0300 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0300 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0300  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0300 INPUT.
CASE SY-UCOMM.
  WHEN 'E3'.
    LEAVE TO SCREEN 200.
ENDCASE.                               "Case sy-ucomm...
ENDMODULE.
*&SPWIZARD: FUNCTION CODES FOR TABSTRIP 'TS1'
CONSTANTS: BEGIN OF C_TS1,
             TAB1 LIKE SY-UCOMM VALUE 'TS1_FC1',
             TAB2 LIKE SY-UCOMM VALUE 'TS1_FC2',
             TAB3 LIKE SY-UCOMM VALUE 'TS1_FC3',
           END OF C_TS1.
*&SPWIZARD: DATA FOR TABSTRIP 'TS1'
CONTROLS:  TS1 TYPE TABSTRIP.
DATA:      BEGIN OF G_TS1,
             SUBSCREEN   LIKE SY-DYNNR,
             PROG        LIKE SY-REPID VALUE 'Z1013492_MPP_AMAZON_DET',
             PRESSED_TAB LIKE SY-UCOMM VALUE C_TS1-TAB1,
           END OF G_TS1.
DATA:      OK_CODE LIKE SY-UCOMM.

*&SPWIZARD: OUTPUT MODULE FOR TS 'TS1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: SETS ACTIVE TAB
MODULE TS1_ACTIVE_TAB_SET OUTPUT.
  TS1-ACTIVETAB = G_TS1-PRESSED_TAB.
  CASE G_TS1-PRESSED_TAB.
    WHEN C_TS1-TAB1.
      G_TS1-SUBSCREEN = '0104'.
    WHEN C_TS1-TAB2.
      G_TS1-SUBSCREEN = '0105'.
    WHEN C_TS1-TAB3.
      G_TS1-SUBSCREEN = '0106'.
    WHEN OTHERS.
*&SPWIZARD:      DO NOTHING
  ENDCASE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TS 'TS1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GETS ACTIVE TAB
MODULE TS1_ACTIVE_TAB_GET INPUT.
  OK_CODE = SY-UCOMM.
  CASE OK_CODE.
    WHEN C_TS1-TAB1.
      G_TS1-PRESSED_TAB = C_TS1-TAB1.
    WHEN C_TS1-TAB2.
      G_TS1-PRESSED_TAB = C_TS1-TAB2.
    WHEN C_TS1-TAB3.
      G_TS1-PRESSED_TAB = C_TS1-TAB3.
    WHEN OTHERS.
*&SPWIZARD:      DO NOTHING
  ENDCASE.
ENDMODULE.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC1' ITSELF
CONTROLS: TC1 TYPE TABLEVIEW USING SCREEN 0200.

*&SPWIZARD: LINES OF TABLECONTROL 'TC1'
DATA:     G_TC1_LINES  LIKE SY-LOOPC.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TC1_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_ORDER LINES TC1-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE TC1_GET_LINES OUTPUT.
  G_TC1_LINES = SY-LOOPC.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE TC1_MODIFY INPUT.
  MODIFY IT_ORDER
    FROM WA_ORDER
    INDEX TC1-CURRENT_LINE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE TC1_USER_COMMAND INPUT.
  OK_CODE = SY-UCOMM.
  PERFORM USER_OK_TC USING    'TC1'
                              'IT_ORDER'
                              ' '
                     CHANGING OK_CODE.
  SY-UCOMM = OK_CODE.
ENDMODULE.

*----------------------------------------------------------------------*
*   INCLUDE TABLECONTROL_FORMS                                         *
*----------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Form  USER_OK_TC                                               *
*&---------------------------------------------------------------------*
 FORM USER_OK_TC USING    P_TC_NAME TYPE DYNFNAM
                          P_TABLE_NAME
                          P_MARK_NAME
                 CHANGING P_OK      LIKE SY-UCOMM.

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
   DATA: L_OK              TYPE SY-UCOMM,
         L_OFFSET          TYPE I.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

*&SPWIZARD: Table control specific operations                          *
*&SPWIZARD: evaluate TC name and operations                            *
   SEARCH P_OK FOR P_TC_NAME.
   IF SY-SUBRC <> 0.
     EXIT.
   ENDIF.
   L_OFFSET = STRLEN( P_TC_NAME ) + 1.
   L_OK = P_OK+L_OFFSET.
*&SPWIZARD: execute general and TC specific operations                 *
   CASE L_OK.
     WHEN 'INSR'.                      "insert row
       PERFORM FCODE_INSERT_ROW USING    P_TC_NAME
                                         P_TABLE_NAME.
       CLEAR P_OK.

     WHEN 'DELE'.                      "delete row
       PERFORM FCODE_DELETE_ROW USING    P_TC_NAME
                                         P_TABLE_NAME
                                         P_MARK_NAME.
       CLEAR P_OK.

     WHEN 'P--' OR                     "top of list
          'P-'  OR                     "previous page
          'P+'  OR                     "next page
          'P++'.                       "bottom of list
       PERFORM COMPUTE_SCROLLING_IN_TC USING P_TC_NAME
                                             L_OK.
       CLEAR P_OK.
*     WHEN 'L--'.                       "total left
*       PERFORM FCODE_TOTAL_LEFT USING P_TC_NAME.
*
*     WHEN 'L-'.                        "column left
*       PERFORM FCODE_COLUMN_LEFT USING P_TC_NAME.
*
*     WHEN 'R+'.                        "column right
*       PERFORM FCODE_COLUMN_RIGHT USING P_TC_NAME.
*
*     WHEN 'R++'.                       "total right
*       PERFORM FCODE_TOTAL_RIGHT USING P_TC_NAME.
*
     WHEN 'MARK'.                      "mark all filled lines
       PERFORM FCODE_TC_MARK_LINES USING P_TC_NAME
                                         P_TABLE_NAME
                                         P_MARK_NAME   .
       CLEAR P_OK.

     WHEN 'DMRK'.                      "demark all filled lines
       PERFORM FCODE_TC_DEMARK_LINES USING P_TC_NAME
                                           P_TABLE_NAME
                                           P_MARK_NAME .
       CLEAR P_OK.

*     WHEN 'SASCEND'   OR
*          'SDESCEND'.                  "sort column
*       PERFORM FCODE_SORT_TC USING P_TC_NAME
*                                   l_ok.

   ENDCASE.

 ENDFORM.                              " USER_OK_TC

*&---------------------------------------------------------------------*
*&      Form  FCODE_INSERT_ROW                                         *
*&---------------------------------------------------------------------*
 FORM fcode_insert_row
               USING    P_TC_NAME           TYPE DYNFNAM
                        P_TABLE_NAME             .

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
   DATA L_LINES_NAME       LIKE FELD-NAME.
   DATA L_SELLINE          LIKE SY-STEPL.
   DATA L_LASTLINE         TYPE I.
   DATA L_LINE             TYPE I.
   DATA L_TABLE_NAME       LIKE FELD-NAME.
   FIELD-SYMBOLS <TC>                 TYPE CXTAB_CONTROL.
   FIELD-SYMBOLS <TABLE>              TYPE STANDARD TABLE.
   FIELD-SYMBOLS <LINES>              TYPE I.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

   ASSIGN (P_TC_NAME) TO <TC>.

*&SPWIZARD: get the table, which belongs to the tc                     *
   CONCATENATE P_TABLE_NAME '[]' INTO L_TABLE_NAME. "table body
   ASSIGN (L_TABLE_NAME) TO <TABLE>.                "not headerline

*&SPWIZARD: get looplines of TableControl                              *
   CONCATENATE 'G_' P_TC_NAME '_LINES' INTO L_LINES_NAME.
   ASSIGN (L_LINES_NAME) TO <LINES>.

*&SPWIZARD: get current line                                           *
   GET CURSOR LINE L_SELLINE.
   IF SY-SUBRC <> 0.                   " append line to table
     L_SELLINE = <TC>-LINES + 1.
*&SPWIZARD: set top line                                               *
     IF L_SELLINE > <LINES>.
       <TC>-TOP_LINE = L_SELLINE - <LINES> + 1 .
     ELSE.
       <TC>-TOP_LINE = 1.
     ENDIF.
   ELSE.                               " insert line into table
     L_SELLINE = <TC>-TOP_LINE + L_SELLINE - 1.
     L_LASTLINE = <TC>-TOP_LINE + <LINES> - 1.
   ENDIF.
*&SPWIZARD: set new cursor line                                        *
   L_LINE = L_SELLINE - <TC>-TOP_LINE + 1.

*&SPWIZARD: insert initial line                                        *
   INSERT INITIAL LINE INTO <TABLE> INDEX L_SELLINE.
   <TC>-LINES = <TC>-LINES + 1.
*&SPWIZARD: set cursor                                                 *
   SET CURSOR 1 L_LINE.

 ENDFORM.                              " FCODE_INSERT_ROW

*&---------------------------------------------------------------------*
*&      Form  FCODE_DELETE_ROW                                         *
*&---------------------------------------------------------------------*
 FORM fcode_delete_row
               USING    P_TC_NAME           TYPE DYNFNAM
                        P_TABLE_NAME
                        P_MARK_NAME   .

*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
   DATA L_TABLE_NAME       LIKE FELD-NAME.

   FIELD-SYMBOLS <TC>         TYPE cxtab_control.
   FIELD-SYMBOLS <TABLE>      TYPE STANDARD TABLE.
   FIELD-SYMBOLS <WA>.
   FIELD-SYMBOLS <MARK_FIELD>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

   ASSIGN (P_TC_NAME) TO <TC>.

*&SPWIZARD: get the table, which belongs to the tc                     *
   CONCATENATE P_TABLE_NAME '[]' INTO L_TABLE_NAME. "table body
   ASSIGN (L_TABLE_NAME) TO <TABLE>.                "not headerline

*&SPWIZARD: delete marked lines                                        *
   DESCRIBE TABLE <TABLE> LINES <TC>-LINES.

   LOOP AT <TABLE> ASSIGNING <WA>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
     ASSIGN COMPONENT P_MARK_NAME OF STRUCTURE <WA> TO <MARK_FIELD>.

     IF <MARK_FIELD> = 'X'.
       DELETE <TABLE> INDEX SYST-TABIX.
       IF SY-SUBRC = 0.
         <TC>-LINES = <TC>-LINES - 1.
       ENDIF.
     ENDIF.
   ENDLOOP.

 ENDFORM.                              " FCODE_DELETE_ROW

*&---------------------------------------------------------------------*
*&      Form  COMPUTE_SCROLLING_IN_TC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_TC_NAME  name of tablecontrol
*      -->P_OK       ok code
*----------------------------------------------------------------------*
 FORM COMPUTE_SCROLLING_IN_TC USING    P_TC_NAME
                                       P_OK.
*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
   DATA L_TC_NEW_TOP_LINE     TYPE I.
   DATA L_TC_NAME             LIKE FELD-NAME.
   DATA L_TC_LINES_NAME       LIKE FELD-NAME.
   DATA L_TC_FIELD_NAME       LIKE FELD-NAME.

   FIELD-SYMBOLS <TC>         TYPE cxtab_control.
   FIELD-SYMBOLS <LINES>      TYPE I.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

   ASSIGN (P_TC_NAME) TO <TC>.
*&SPWIZARD: get looplines of TableControl                              *
   CONCATENATE 'G_' P_TC_NAME '_LINES' INTO L_TC_LINES_NAME.
   ASSIGN (L_TC_LINES_NAME) TO <LINES>.


*&SPWIZARD: is no line filled?                                         *
   IF <TC>-LINES = 0.
*&SPWIZARD: yes, ...                                                   *
     L_TC_NEW_TOP_LINE = 1.
   ELSE.
*&SPWIZARD: no, ...                                                    *
     CALL FUNCTION 'SCROLLING_IN_TABLE'
          EXPORTING
               ENTRY_ACT             = <TC>-TOP_LINE
               ENTRY_FROM            = 1
               ENTRY_TO              = <TC>-LINES
               LAST_PAGE_FULL        = 'X'
               LOOPS                 = <LINES>
               OK_CODE               = P_OK
               OVERLAPPING           = 'X'
          IMPORTING
               ENTRY_NEW             = L_TC_NEW_TOP_LINE
          EXCEPTIONS
*              NO_ENTRY_OR_PAGE_ACT  = 01
*              NO_ENTRY_TO           = 02
*              NO_OK_CODE_OR_PAGE_GO = 03
               OTHERS                = 0.
   ENDIF.

*&SPWIZARD: get actual tc and column                                   *
   GET CURSOR FIELD L_TC_FIELD_NAME
              AREA  L_TC_NAME.

   IF SYST-SUBRC = 0.
     IF L_TC_NAME = P_TC_NAME.
*&SPWIZARD: et actual column                                           *
       SET CURSOR FIELD L_TC_FIELD_NAME LINE 1.
     ENDIF.
   ENDIF.

*&SPWIZARD: set the new top line                                       *
   <TC>-TOP_LINE = L_TC_NEW_TOP_LINE.


 ENDFORM.                              " COMPUTE_SCROLLING_IN_TC

*&---------------------------------------------------------------------*
*&      Form  FCODE_TC_MARK_LINES
*&---------------------------------------------------------------------*
*       marks all TableControl lines
*----------------------------------------------------------------------*
*      -->P_TC_NAME  name of tablecontrol
*----------------------------------------------------------------------*
FORM FCODE_TC_MARK_LINES USING P_TC_NAME
                               P_TABLE_NAME
                               P_MARK_NAME.
*&SPWIZARD: EGIN OF LOCAL DATA-----------------------------------------*
  DATA L_TABLE_NAME       LIKE FELD-NAME.

  FIELD-SYMBOLS <TC>         TYPE cxtab_control.
  FIELD-SYMBOLS <TABLE>      TYPE STANDARD TABLE.
  FIELD-SYMBOLS <WA>.
  FIELD-SYMBOLS <MARK_FIELD>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (P_TC_NAME) TO <TC>.

*&SPWIZARD: get the table, which belongs to the tc                     *
   CONCATENATE P_TABLE_NAME '[]' INTO L_TABLE_NAME. "table body
   ASSIGN (L_TABLE_NAME) TO <TABLE>.                "not headerline

*&SPWIZARD: mark all filled lines                                      *
  LOOP AT <TABLE> ASSIGNING <WA>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
     ASSIGN COMPONENT P_MARK_NAME OF STRUCTURE <WA> TO <MARK_FIELD>.

     <MARK_FIELD> = 'X'.
  ENDLOOP.
ENDFORM.                                          "fcode_tc_mark_lines

*&---------------------------------------------------------------------*
*&      Form  FCODE_TC_DEMARK_LINES
*&---------------------------------------------------------------------*
*       demarks all TableControl lines
*----------------------------------------------------------------------*
*      -->P_TC_NAME  name of tablecontrol
*----------------------------------------------------------------------*
FORM FCODE_TC_DEMARK_LINES USING P_TC_NAME
                                 P_TABLE_NAME
                                 P_MARK_NAME .
*&SPWIZARD: BEGIN OF LOCAL DATA----------------------------------------*
  DATA L_TABLE_NAME       LIKE FELD-NAME.

  FIELD-SYMBOLS <TC>         TYPE cxtab_control.
  FIELD-SYMBOLS <TABLE>      TYPE STANDARD TABLE.
  FIELD-SYMBOLS <WA>.
  FIELD-SYMBOLS <MARK_FIELD>.
*&SPWIZARD: END OF LOCAL DATA------------------------------------------*

  ASSIGN (P_TC_NAME) TO <TC>.

*&SPWIZARD: get the table, which belongs to the tc                     *
   CONCATENATE P_TABLE_NAME '[]' INTO L_TABLE_NAME. "table body
   ASSIGN (L_TABLE_NAME) TO <TABLE>.                "not headerline

*&SPWIZARD: demark all filled lines                                    *
  LOOP AT <TABLE> ASSIGNING <WA>.

*&SPWIZARD: access to the component 'FLAG' of the table header         *
     ASSIGN COMPONENT P_MARK_NAME OF STRUCTURE <WA> TO <MARK_FIELD>.

     <MARK_FIELD> = SPACE.
  ENDLOOP.
ENDFORM.                                          "fcode_tc_mark_lines

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC2' ITSELF
CONTROLS: TC2 TYPE TABLEVIEW USING SCREEN 0300.

*&SPWIZARD: LINES OF TABLECONTROL 'TC2'
DATA:     G_TC2_LINES  LIKE SY-LOOPC.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TC2_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_PRDET LINES TC2-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE TC2_GET_LINES OUTPUT.
  G_TC2_LINES = SY-LOOPC.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE TC2_MODIFY INPUT.
  MODIFY IT_PRDET
    FROM WA_PRDET
    INDEX TC2-CURRENT_LINE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC2'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE TC2_USER_COMMAND INPUT.
  OK_CODE = SY-UCOMM.
  PERFORM USER_OK_TC USING    'TC2'
                              'IT_PRDET'
                              ' '
                     CHANGING OK_CODE.
  SY-UCOMM = OK_CODE.
ENDMODULE.
