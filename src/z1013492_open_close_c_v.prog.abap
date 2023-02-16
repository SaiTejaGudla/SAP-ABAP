*&---------------------------------------------------------------------*
*& Report Z1013492_OPEN_CLOSE_C_V
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_open_close_c_v.

TYPES: BEGIN OF ty_cust,
         bukrs TYPE bsid-bukrs,
         kunnr TYPE bsid-kunnr,
         augdt TYPE bsid-augdt,
         budat TYPE bsid-budat,
         zuonr TYPE bsad-zuonr,
       END OF ty_cust,

       BEGIN OF ty_vend,
         bukrs TYPE bsik-bukrs,
         lifnr TYPE bsik-lifnr,
         augdt TYPE bsik-augdt,
         budat TYPE bsak-budat,
         augbl TYPE bsak-augbl,
         zuonr TYPE bsak-zuonr,
       END OF ty_vend,

       BEGIN OF ty_cu_open,
         bukrs TYPE bsid-bukrs,
         kunnr TYPE bsid-kunnr,
         augdt TYPE bsid-augdt,
         budat TYPE bsad-budat,
         zuonr TYPE bsad-zuonr,
       END OF ty_cu_open,

       BEGIN OF ty_v_open,
         bukrs TYPE bsik-bukrs,
         lifnr TYPE bsik-lifnr,
         augdt TYPE bsik-augdt,
         budat TYPE bsik-budat,
         augbl TYPE bsik-augbl,
         zuonr TYPE bsik-zuonr,
       END OF ty_v_open.

DATA: it_cust      TYPE TABLE OF ty_cust,
      wa_cust      TYPE ty_cust,

      it_vend      TYPE TABLE OF ty_vend,
      wa_vend      TYPE ty_vend,

      it_open_cust TYPE TABLE OF ty_cu_open,
      wa_open_cust TYPE ty_cu_open,

      it_open_vend TYPE TABLE OF ty_v_open,
      wa_open_vend TYPE ty_v_open,

      g_budat      TYPE bsid-budat,

      g_budate     TYPE bsik-budat.




SELECTION-SCREEN BEGIN OF BLOCK bk1 WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(40) com1.
  PARAMETERS: p_cust RADIOBUTTON GROUP rg1 USER-COMMAND uc1,
              p_cus  TYPE kunnr MODIF ID md1.
  SELECT-OPTIONS: s_cust FOR g_budat MODIF ID md1.

  PARAMETERS: p_vend RADIOBUTTON GROUP rg1 DEFAULT 'X',
              p_ven  TYPE lifnr MODIF ID md2.

  SELECT-OPTIONS: s_vens FOR g_budate MODIF ID md2.

SELECTION-SCREEN END OF BLOCK bk1.

SELECTION-SCREEN BEGIN OF BLOCK bk2 WITH FRAME TITLE t2.
  SELECTION-SCREEN COMMENT 2(40) com2.

  PARAMETERS    : p_date1 RADIOBUTTON GROUP rg2 USER-COMMAND uc2.
  SELECT-OPTIONS: s_date1 FOR (bsid~budat) MODIF ID md3.

  PARAMETERS    : P_date2 RADIOBUTTON GROUP rg2 DEFAULT 'X'.
  SELECT-OPTIONS: s_date2 FOR (bsik-budat) MODIF ID md4.

SELECTION-SCREEN END OF BLOCK bk2.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.

    IF p_cust = 'X' AND screen-group1 = 'MD1'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_cust = ' ' AND screen-group1 = 'MD1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.

    IF p_cust = ' ' AND screen-group1 = 'MD1'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_cust = 'X' AND screen-group1 = 'MD1'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.

    IF p_vend = 'X' AND screen-group1 = 'MD2'.
      screen-active = 1.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_vend = ' ' AND screen-group1 = 'MD2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.

    IF p_vend = ' ' AND screen-group1 = 'MD2'.
      screen-active = 0.
      MODIFY SCREEN.
      CONTINUE.
    ELSEIF p_vend = 'X' AND screen-group1 = 'MD2'.
      screen-active = 1.
      MODIFY SCREEN.
    CONTINUE.
    ENDIF.

      IF p_date1 = 'X' AND screen-group1 = 'MD3'.
        screen-active = 1.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF p_date1 = ' ' AND screen-group1 = 'MD3'.
        screen-active = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.

      IF p_date2 = 'X' AND screen-group1 = 'MD4'.
        screen-active = 1.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF p_date2 = ' ' AND screen-group1 = 'MD4'.
        screen-active = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.


    ENDLOOP.

INITIALIZATION.
  t1   = 'CUSTOMER AND VENDOR OPENING AND CLOSING DETAILS'.
  com1 = ' Click Any Radio Button'.
  com2 = ' Select the Dates'.


START-OF-SELECTION.

  IF p_cust = 'X'.

    SELECT bsid~bukrs
           bsid~kunnr
           bsid~augdt
           bsad~budat
           bsad~zuonr
      FROM bsid
      LEFT OUTER JOIN bsad
        ON bsid~kunnr = bsad~kunnr
      INTO TABLE it_cust
     WHERE bsid~kunnr = p_cus
        OR bsid~budat IN s_cust.

      LOOP AT it_cust INTO wa_cust.
        WRITE:/ wa_cust-bukrs,
                wa_cust-kunnr,
                wa_cust-augdt,
                wa_cust-budat,
                wa_cust-zuonr.

      ENDLOOP.

    ELSEIF p_vend = 'X'.

      SELECT bik~bukrs
             bik~lifnr
             bik~augdt
             bak~budat
             bak~augbl
             bak~zuonr
        FROM bsik AS bik
        LEFT OUTER JOIN bsak AS bak
          ON bik~lifnr = bak~lifnr
        INTO TABLE it_vend
       WHERE bik~lifnr = p_ven
          OR bik~budat IN s_vens.

        LOOP AT it_vend INTO wa_vend.

          WRITE:/ wa_vend-bukrs,
                  wa_vend-lifnr,
                  wa_vend-augdt,
                  wa_vend-budat,
                  wa_vend-augbl,
                  wa_vend-zuonr.

        ENDLOOP.

      ELSEIF p_date1 = 'X'.

        SELECT bukrs
               kunnr
               augdt
               budat
               zuonr
          FROM bsid
          INTO TABLE it_open_cust
         WHERE augdt IN s_date1.

          LOOP AT it_open_cust INTO wa_open_cust.

            WRITE:/ wa_open_cust-bukrs,
                    wa_open_cust-kunnr,
                    wa_open_cust-augdt,
                    wa_open_cust-budat,
                    wa_open_cust-zuonr.
          ENDLOOP.

        ELSEIF P_date2 = 'X'.

          SELECT bukrs
                 lifnr
                 augdt
                 budat
                 augbl
                 zuonr
            FROM bsik
            INTO TABLE it_open_vend
           WHERE augdt IN s_date2.

            LOOP AT it_open_vend INTO wa_open_vend.

              WRITE:/ wa_open_vend-bukrs,
                      wa_open_vend-lifnr,
                      wa_open_vend-augdt,
                      wa_open_vend-budat,
                      wa_open_vend-augbl,
                      wa_open_vend-zuonr.

            ENDLOOP.
          ENDIF.






*TYPES :
*  "structure declartions for customer opening details
*  BEGIN OF ty_bsid,
*    bukrs TYPE bukrs,                     "company code
*    kunnr TYPE kunnr,                     "account number
*    umsks TYPE umsks,                     "transcation type
*    umskz TYPE umskz,                     "indicator
*    augdt TYPE augdt,                     "clearing date
*    augbl TYPE augbl,                     "document number for clearing date
*    zuonr TYPE dzuonr,                    "assignment number
*    gjahr TYPE gjahr,                     "fiscal year
*    belnr TYPE belnr_d,                   "accounting document number
*    buzei TYPE buzei,                     "number of line item within accounting document
*    budat TYPE budat,                     "psoting date in the document
*  END OF ty_bsid,
*  "structure declartions for customer closing details
*  BEGIN OF ty_bsad,
*    bukrs TYPE bukrs,
*    kunnr TYPE kunnr,
*    umsks TYPE umsks,
*    umskz TYPE umskz,
*    augdt TYPE augdt,
*    augbl TYPE augbl,
*    zuonr TYPE dzuonr,
*    gjahr TYPE gjahr,
*    belnr TYPE belnr_d,
*    buzei TYPE buzei,
*    budat TYPE budat,
*  END OF ty_bsad.
*
*TYPES :
*  "structure declartions for vendor opening details
*  BEGIN OF ty_bsik,
*    bukrs TYPE bukrs,
*    lifnr TYPE lifnr,
*    umsks TYPE umsks,
*    umskz TYPE umskz,
*    augdt TYPE augdt,
*    augbl TYPE augbl,
*    zuonr TYPE dzuonr,
*    gjahr TYPE gjahr,
*    belnr TYPE belnr_d,
*    buzei TYPE buzei,
*    budat TYPE budat,
*  END OF ty_bsik,
*  "structure declartions for vendor closing details
*  BEGIN OF ty_bsak,
*    bukrs TYPE bukrs,
*    lifnr TYPE lifnr,
*    umsks TYPE umsks,
*    umskz TYPE umskz,
*    augdt TYPE augdt,
*    augbl TYPE augbl,
*    zuonr TYPE dzuonr,
*    gjahr TYPE gjahr,
*    belnr TYPE belnr_d,
*    buzei TYPE buzei,
*    budat TYPE budat,
*  END OF ty_bsak.
*
*DATA :
*  "internal table and work declartions for customer opening details
*  it_bsid TYPE TABLE OF ty_bsid,
*  wa_bsid TYPE ty_bsid,
*  "internal table and work declartions for customer  closing details
*  it_bsad TYPE TABLE OF ty_bsad,
*  wa_bsad TYPE ty_bsad,
*  "internal table and work declartions for vendor opening details
*  it_bsik TYPE TABLE OF ty_bsik,
*  wa_bsik TYPE ty_bsik,
*  "internal table and work declartions for vendor closing details
*  it_bsak TYPE TABLE OF ty_bsak,
*  wa_bsak TYPE ty_bsak.
*
*"selection screen for block b1
*SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t1.
*  SELECTION-SCREEN COMMENT 2(25) in1.
*  PARAMETERS :
*  "Radiobutton for customer details
*               p_cust  RADIOBUTTON GROUP rad1  USER-COMMAND uc1,
*  "parameter for customer id
*               p_kunnr TYPE kunnr MODIF ID mo1.
*  "select Option for date
*  SELECT-OPTIONS s_date FOR (bsid~augdt) MODIF ID mo1.
*  PARAMETERS :
*  "Radiobutton for vendor details
*               p_vend  RADIOBUTTON GROUP rad1,
*   "parameter for vendor id
*               p_lifnr TYPE lifnr MODIF ID mo2.
*   "select Option for date
*  SELECT-OPTIONS s_date1 FOR (bsik~augdt) MODIF ID mo2.
*  PARAMETERS : p_none  RADIOBUTTON GROUP rad1 DEFAULT 'X'.
*SELECTION-SCREEN END OF BLOCK b1.
*"selection screen for block b2
*SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE t2.
*  SELECTION-SCREEN COMMENT 2(20) in2.
*  PARAMETERS :
* "parameter for opening and closing details
*               p_open  RADIOBUTTON GROUP rad2 USER-COMMAND uc2 DEFAULT 'X',
*               p_close RADIOBUTTON GROUP rad2.
*SELECTION-SCREEN END OF BLOCK b2.
*"initilazing values for t1 and t2
*INITIALIZATION.
*  t1 = 'Customer and vendor details'.
*  in1 = 'Click Any Radiobutton'.
*  t2 = 'Opeing and Closing Details'.
*
*AT SELECTION-SCREEN OUTPUT.
*  LOOP AT SCREEN.
*    IF p_cust = 'X' AND screen-group1 = 'MO1'.
*      screen-active = 1.
*      MODIFY SCREEN.
*      CONTINUE.
*    ELSEIF p_vend = 'X' AND screen-group1 = 'MO2'.
*      screen-active = 1.
*      MODIFY SCREEN.
*      CONTINUE.
*    ELSEIF p_cust = ' ' AND screen-group1 = 'MO1'.
*      screen-active = 0.
*      MODIFY SCREEN.
*      CONTINUE.
*    ELSEIF p_vend = ' ' AND screen-group1 = 'MO2'.
*      screen-active = 0.
*      MODIFY SCREEN.
*      CONTINUE.
*
*    ENDIF.
*  ENDLOOP.
*
*START-OF-SELECTION.
*  IF p_cust = 'X'.
*    IF p_open = 'X'.
*      SELECT bukrs
*             kunnr
*             umsks
*             umskz
*             augdt
*             augbl
*             zuonr
*             gjahr
*             belnr
*             buzei
*             budat
*        FROM bsid INTO TABLE it_bsid WHERE bsid~kunnr = p_kunnr.
*      IF sy-subrc = 0 AND it_bsid IS NOT INITIAL.
*        LOOP AT it_bsid INTO wa_bsid.
*          WRITE : /  wa_bsid-bukrs,
*                     wa_bsid-kunnr,
*                     wa_bsid-umsks,
*                     wa_bsid-umskz,
*                     wa_bsid-augdt,
*                     wa_bsid-augbl,
*                     wa_bsid-zuonr,
*                     wa_bsid-gjahr,
*                     wa_bsid-belnr,
*                     wa_bsid-buzei,
*                     wa_bsid-budat.
*        ENDLOOP.
*      ELSE.
*        MESSAGE 'Data Not found' TYPE 'E'.
*      ENDIF.
*    ENDIF.
*    IF p_close = 'X'.
*      SELECT  bukrs
*              kunnr
*              umsks
*              umskz
*              augdt
*              augbl
*              zuonr
*              gjahr
*              belnr
*              buzei
*              budat
*        FROM bsad INTO TABLE it_bsad WHERE bsad~kunnr = p_kunnr.
*      IF sy-subrc = 0 AND it_bsad IS NOT INITIAL.
*        LOOP AT it_bsad INTO wa_bsad.
*          WRITE : /  wa_bsad-bukrs,
*                     wa_bsad-kunnr,
*                     wa_bsad-umsks,
*                     wa_bsad-umskz,
*                     wa_bsad-augdt,
*                     wa_bsad-augbl,
*                     wa_bsad-zuonr,
*                     wa_bsad-gjahr,
*                     wa_bsad-belnr,
*                     wa_bsad-buzei,
*                     wa_bsad-budat.
*        ENDLOOP.
*      ELSE.
*        MESSAGE 'Data Not found' TYPE 'E'.
*      ENDIF.
*    ENDIF.
*  ELSEIF p_vend = 'X'.
*    IF p_open = 'X'.
*      SELECT    bukrs
*                lifnr
*                umsks
*                umskz
*                augdt
*                augbl
*                zuonr
*                gjahr
*                belnr
*                buzei
*                budat
*        FROM bsik INTO TABLE it_bsik WHERE bsik~lifnr = p_lifnr.
*      IF sy-subrc = 0 AND it_bsik IS NOT INITIAL.
*        LOOP AT it_bsik INTO wa_bsik.
*          WRITE : /  wa_bsik-bukrs,
*                     wa_bsik-lifnr,
*                     wa_bsik-umsks,
*                     wa_bsik-umskz,
*                     wa_bsik-augdt,
*                     wa_bsik-augbl,
*                     wa_bsik-zuonr,
*                     wa_bsik-gjahr,
*                     wa_bsik-belnr,
*                     wa_bsik-buzei,
*                     wa_bsik-budat.
*        ENDLOOP.
*      ELSE.
*        MESSAGE 'Data Not found' TYPE 'E'.
*      ENDIF.
*    ENDIF.
*    IF p_close = 'X'.
*      SELECT    bukrs
*                lifnr
*                umsks
*                umskz
*                augdt
*                augbl
*                zuonr
*                gjahr
*                belnr
*                buzei
*                budat
*        FROM bsak INTO TABLE it_bsak WHERE bsak~lifnr = p_lifnr.
*      IF sy-subrc = 0 AND it_bsak IS NOT INITIAL.
*        LOOP AT it_bsak INTO wa_bsak.
*          WRITE : /  wa_bsak-bukrs,
*                     wa_bsak-lifnr,
*                     wa_bsak-umsks,
*                     wa_bsak-umskz,
*                     wa_bsak-augdt,
*                     wa_bsak-augbl,
*                     wa_bsak-zuonr,
*                     wa_bsak-gjahr,
*                     wa_bsak-belnr,
*                     wa_bsak-buzei,
*                     wa_bsak-budat.
*        ENDLOOP.
*      ELSE.
*        MESSAGE 'Data Not found' TYPE 'E'.
*      ENDIF.
*    ENDIF.
*  ENDIF.
