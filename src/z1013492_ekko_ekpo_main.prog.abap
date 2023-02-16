*&---------------------------------------------------------------------*
*& INCLUDE Z1013492_EKKO_EKPO_MAIN
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& FORM GET_DATA
*&---------------------------------------------------------------------*
*& TEXT
*&---------------------------------------------------------------------*
*& --> P1 TEXT
*& <-- P2 TEXT
*&---------------------------------------------------------------------*
*"--------------------------------------------------------------------*
*FORM get_data .                                                      *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM get_data .
  SELECT ekko~ebeln
         ekko~bukrs
         ekko~bstyp
         ekko~bsart
         ekko~aedat
         ekko~lifnr
    FROM ekko
    INTO TABLE it_ekko
   WHERE ebeln IN s_ebeln.

  IF sy-subrc <> 0 AND it_ekko IS INITIAL.
    MESSAGE ' DATA NOT FOUND' TYPE 'I'.
  ELSEIF it_ekko IS NOT INITIAL.
    SELECT ekpo~ebeln
           ekpo~ebelp
           ekpo~menge
           ekpo~meins
           ekpo~peinh
           ekpo~netpr
           ekpo~adrn2
      FROM ekpo
      INTO TABLE it_ekpo
       FOR ALL ENTRIES IN it_ekko
    WHERE ebeln = it_ekko-ebeln.

    IF it_ekpo IS NOT INITIAL.
      LOOP AT it_ekpo INTO wa_ekpo.
        READ TABLE it_ekko INTO wa_ekko WITH KEY ebeln = wa_ekpo-ebeln.
        wa_final-ebeln = wa_ekko-ebeln.
        wa_final-bukrs = wa_ekko-bukrs.
        wa_final-bstyp = wa_ekko-bstyp.
        wa_final-bsart = wa_ekko-bsart.
        wa_final-aedat = wa_ekko-aedat.
        wa_final-lifnr = wa_ekko-lifnr.
        wa_final-ebelp = wa_ekpo-ebelp.
        wa_final-menge = wa_ekpo-menge.
        wa_final-meins = wa_ekpo-meins.
        wa_final-peinh = wa_ekpo-peinh.
        wa_final-netpr = wa_ekpo-netpr.
        wa_final-adrn2 = wa_ekpo-adrn2.
        APPEND wa_final TO it_final.
        CLEAR wa_final.
      ENDLOOP.                         "LOOP AT it_ekpo INTO wa_ekpo.
    ENDIF.                             "IF it_ekpo IS NOT INITIAL.
  ENDIF.                               "IF sy-subrc <> 0 AND it_ekko IS INITIAL.
  IF sy-subrc = 0.
    LOOP AT it_final INTO wa_final.
      IF wa_final-menge < 500.
        wa_final-colour = 'C610'.
      ENDIF.                           "IF wa_final-menge < 500.
      MODIFY it_final FROM wa_final TRANSPORTING colour.
      CLEAR wa_final.
    ENDLOOP.                           "LOOP AT it_final INTO wa_final.
  ENDIF.                               "IF sy-subrc = 0.
ENDFORM.                               "FORM get_data .
*&---------------------------------------------------------------------*
*& FORM FIELDCAT1
*&---------------------------------------------------------------------*
*& TEXT
*&---------------------------------------------------------------------*
*& --> P1 TEXT
*& <-- P2 TEXT
*&---------------------------------------------------------------------*
*"--------------------------------------------------------------------*
*FORM fieldcat1 .                                                     *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM fieldcat1 .
  wa_fcat-fieldname = 'EBELN'.
  wa_fcat-col_pos = 1.
  wa_fcat-seltext_m = 'PURCHASING DOCUMENT NUMBER'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'BUKRS'.
  wa_fcat-col_pos = 2.
  wa_fcat-seltext_m = 'COMPANY CODE'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'BSTYP'.
  wa_fcat-col_pos = 3.
  wa_fcat-seltext_m = 'PURCHASING DOCUMENT CATEGORY'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'BSART'.
  wa_fcat-col_pos = 4.
  wa_fcat-seltext_m = 'PURCHASING DOCUMENT TYPE'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'AEDAT'.
  wa_fcat-col_pos = 5.
  wa_fcat-seltext_m = 'ENTRY DATE'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'LIFNR'.
  wa_fcat-col_pos = 6.
  wa_fcat-seltext_m = 'VENDORS ACCOUNT NUMBER'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'EBELP'.
  wa_fcat-col_pos = 7.
  wa_fcat-seltext_m = 'ITEM NUMBER'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'MENGE'.
  wa_fcat-col_pos = 8.
  wa_fcat-seltext_m = 'PURCHASE ORDER QUANTITY'.
  wa_fcat-do_sum = 'X'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'MEINS'.
  wa_fcat-col_pos = 9.
  wa_fcat-seltext_m = 'UNIT OF MEASURE'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'PEINH'.
  wa_fcat-col_pos = 10.
  wa_fcat-seltext_m = 'PRICE UNIT'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'NETPR'.
  wa_fcat-col_pos = 11.
  wa_fcat-seltext_m = 'NET PRICE'.
  wa_fcat-do_sum = 'X'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'ADRN2'.
  wa_fcat-col_pos = 12.
  wa_fcat-seltext_m = 'NUMBER OF DELIVERY ADDRESS'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.
  gs_layout-info_fieldname = 'COLOUR'.

  wa_sort-spos = 1.
  wa_sort-fieldname = 'EBELN'.
  wa_sort-up = 'X'.
  wa_sort-subtot = 'X'.
  APPEND wa_sort TO it_sort.

  wa_event-name = 'TOP_OF_PAGE'.
  wa_event-form = 'LIST_HEADER'.
  APPEND wa_event TO it_event.
  CLEAR wa_event.

  wa_event-name = 'END_OF_LIST'.
  wa_event-form = 'LIST_FOOTER'.
  APPEND wa_event TO it_event.
  CLEAR wa_event.

  PERFORM display_ekko_ekpo.
  PERFORM list_header.
ENDFORM.                               "FORM fieldcat1 .
*&---------------------------------------------------------------------*
*& FORM DISPLAY_EKKO_EKPO
*&---------------------------------------------------------------------*
*& TEXT
*&---------------------------------------------------------------------*
*& --> P1 TEXT
*& <-- P2 TEXT
*&---------------------------------------------------------------------*
*"--------------------------------------------------------------------*
*FORM display_ekko_ekpo .                                             *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM display_ekko_ekpo .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK        = ' '
*     I_BYPASSING_BUFFER       = ' '
      i_buffer_active          = 'X'
      i_callback_program       = sy-repid
      i_callback_pf_status_set = 'PF_STATUS'
      i_callback_user_command  = 'U_COMM'
*     I_CALLBACK_TOP_OF_PAGE   = 'LIST_HEADER'
*     I_CALLBACK_HTML_TOP_OF_PAGE = ' '
*     I_CALLBACK_HTML_END_OF_LIST = ' '
*     I_STRUCTURE_NAME         =
*     I_BACKGROUND_ID          = ' '
*     I_GRID_TITLE             =
*     I_GRID_SETTINGS          =
      is_layout                = gs_layout
      it_fieldcat              = it_fcat
*     IT_EXCLUDING             =
*     IT_SPECIAL_GROUPS        =
      it_sort                  = it_sort
*     IT_FILTER                =
*     IS_SEL_HIDE              =
*     I_DEFAULT                = 'X'
*     I_SAVE                   = ' '
*     IS_VARIANT               =
      it_events                = it_event
*     IT_EVENT_EXIT            =
*     IS_PRINT                 =
*     IS_REPREP_ID             =
*     I_SCREEN_START_COLUMN    = 0
*     I_SCREEN_START_LINE      = 0
*     I_SCREEN_END_COLUMN      = 0
*     I_SCREEN_END_LINE        = 0
*     I_HTML_HEIGHT_TOP        = 0
*     I_HTML_HEIGHT_END        = 0
*     IT_ALV_GRAPHICS          =
*     IT_HYPERLINK             =
*     IT_ADD_FIELDCAT          =
*     IT_EXCEPT_QINFO          =
*     IR_SALV_FULLSCREEN_ADAPTER =
*     O_PREVIOUS_SRAL_HANDLER  =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER  =
*     ES_EXIT_CAUSED_BY_USER   =
    TABLES
      t_outtab                 = it_final
* EXCEPTIONS
*     PROGRAM_ERROR            = 1
*     OTHERS                   = 2
    .
  IF sy-subrc <> 0.
* IMPLEMENT SUITABLE ERROR HANDLING HERE
  ENDIF.                               "IF sy-subrc <> 0.
  REFRESH it_event.
ENDFORM.                               "FORM display_ekko_ekpo .
*&---------------------------------------------------------------------*
*& FORM LIST_HEADER
*&---------------------------------------------------------------------*
*& TEXT
*&---------------------------------------------------------------------*
*& --> P1 TEXT
*& <-- P2 TEXT
*&---------------------------------------------------------------------*
*"--------------------------------------------------------------------*
*FORM list_header .                                                   *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM list_header .
  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'H'.
  wa_header-info = 'PURCHASE DETAILS'.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  wa_header-typ = 'S'.
  wa_header-key = 'NAME:'.
  wa_header-info = sy-uname.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  wa_header-typ = 'S'.
  wa_header-key = 'DATE:'.
  wa_header-info = sy-datum.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
      i_logo             = 'LOGO'.
* I_END_OF_LIST_GRID =
* I_ALV_FORM =
ENDFORM.                               "FORM list_header .
*"--------------------------------------------------------------------*
*FORM list_footer.                                                    *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM list_footer.
  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'H'.
  wa_header-key = 'END OF PAGE'.
  wa_header-info = 'PURCHASE DETAILS'.
  APPEND wa_header TO it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
*     I_LOGO             =
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .
ENDFORM.                               "FORM list_footer.
*"--------------------------------------------------------------------*
*FORM u_comm USING r_ucom TYPE sy-ucomm                               *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM u_comm USING r_ucom TYPE sy-ucomm
                  r_selfield TYPE slis_selfield.

  CASE r_ucom.

    WHEN '&IC1'.

      READ TABLE it_final INTO wa_final INDEX r_selfield-tabindex.

      IF sy-subrc = 0 AND it_final IS NOT INITIAL.

        SELECT lifnr
        land1
        name1
        name2
        FROM lfa1
        INTO TABLE it_lfa1
        WHERE lifnr = wa_final-lifnr.

      ELSEIF sy-subrc <> 0.
        MESSAGE 'DATA NOT READ' TYPE 'I'.
      ENDIF.                           "IF sy-subrc = 0 AND it_final IS NOT INITIAL.
      PERFORM fieldcat2.
      PERFORM display_lfa1.
      PERFORM top_of_page.

    WHEN 'ME21N'.
      SET PARAMETER ID 'BAS' FIELD wa_final-ebeln.
      CALL TRANSACTION 'ME21N' AND SKIP FIRST SCREEN.
  ENDCASE.                             "CASE r_ucom.
ENDFORM.                               "FORM u_comm USING r_ucom TYPE sy-ucomm
*"--------------------------------------------------------------------*
*FORM pf_status USING r_co TYPE slis_t_extab.                         *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM pf_status USING r_co TYPE slis_t_extab.
  SET PF-STATUS 'Z1013492_PF'.
ENDFORM.                               "FORM pf_status USING r_co TYPE slis_t_extab.
*&---------------------------------------------------------------------*
*& FORM FIELDCAT2
*&---------------------------------------------------------------------*
*& TEXT
*&---------------------------------------------------------------------*
*& --> P1 TEXT
*& <-- P2 TEXT
*&---------------------------------------------------------------------*
*"--------------------------------------------------------------------*
*FORM fieldcat2 .                                                     *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM fieldcat2 .
  CLEAR wa_fcat.
  REFRESH it_fcat.

  wa_fcat-fieldname = 'LIFNR'.
  wa_fcat-col_pos = 1.
  wa_fcat-seltext_m = 'VENDOR ACCOUNT NUMBER'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'LAND1'.
  wa_fcat-col_pos = 2.
  wa_fcat-seltext_m = 'COUNTRY'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'NAME1'.
  wa_fcat-col_pos = 3.
  wa_fcat-seltext_m = 'FIRST NAME'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'NAME2'.
  wa_fcat-col_pos = 4.
  wa_fcat-seltext_m = 'MIDDLE NAME'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.

  wa_event-name = 'TOP_OF_PAGE'.
  wa_event-form = 'TOP_OF_PAGE'.
  APPEND wa_event TO it_event.
  CLEAR wa_event.

  wa_event-name = 'END_OF_LIST'.
  wa_event-form = 'END_OF_PAGE'.
  APPEND wa_event TO it_event.
  CLEAR wa_event.
ENDFORM.                               "FORM fieldcat2 .
*&---------------------------------------------------------------------*
*& FORM DISPLAY_LFA1
*&---------------------------------------------------------------------*
*& TEXT
*&---------------------------------------------------------------------*
*& --> P1 TEXT
*& <-- P2 TEXT
*&---------------------------------------------------------------------*
*"--------------------------------------------------------------------*
*FORM display_lfa1 .                                                  *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM display_lfa1 .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK  = ' '
*     I_BYPASSING_BUFFER = ' '
      i_buffer_active    = 'X'
      i_callback_program = sy-repid
*     I_CALLBACK_PF_STATUS_SET = ' '
*     I_CALLBACK_USER_COMMAND = ' '
*     I_CALLBACK_TOP_OF_PAGE = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE = ' '
*     I_CALLBACK_HTML_END_OF_LIST = ' '
*     I_STRUCTURE_NAME   =
*     I_BACKGROUND_ID    = ' '
*     I_GRID_TITLE       =
*     I_GRID_SETTINGS    =
      is_layout          = gs_layout
      it_fieldcat        = it_fcat
*     IT_EXCLUDING       =
*     IT_SPECIAL_GROUPS  =
*     IT_SORT            =
*     IT_FILTER          =
*     IS_SEL_HIDE        =
*     I_DEFAULT          = 'X'
*     I_SAVE             = ' '
*     IS_VARIANT         =
      it_events          = it_event
*     IT_EVENT_EXIT      =
*     IS_PRINT           =
*     IS_REPREP_ID       =
*     I_SCREEN_START_COLUMN = 0
*     I_SCREEN_START_LINE = 0
*     I_SCREEN_END_COLUMN = 0
*     I_SCREEN_END_LINE  = 0
*     I_HTML_HEIGHT_TOP  = 0
*     I_HTML_HEIGHT_END  = 0
*     IT_ALV_GRAPHICS    =
*     IT_HYPERLINK       =
*     IT_ADD_FIELDCAT    =
*     IT_EXCEPT_QINFO    =
*     IR_SALV_FULLSCREEN_ADAPTER =
*     O_PREVIOUS_SRAL_HANDLER =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER =
*     ES_EXIT_CAUSED_BY_USER =
    TABLES
      t_outtab           = it_lfa1
* EXCEPTIONS
*     PROGRAM_ERROR      = 1
*     OTHERS             = 2
    .
  IF sy-subrc <> 0.
* IMPLEMENT SUITABLE ERROR HANDLING HERE
  ENDIF.                               "IF sy-subrc <> 0.
ENDFORM.                               "FORM display_lfa1 .
*"--------------------------------------------------------------------*
*FORM top_of_page.                                                    *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM top_of_page.
  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'H'.
  wa_header-info = 'SUPPLIER DETAILS'.
  APPEND wa_header TO it_header.

  wa_header-typ = 'S'.
  wa_header-key = 'NAME:'.
  wa_header-info = sy-uname.
  APPEND wa_header TO it_header.

  wa_header-typ = 'S'.
  wa_header-key = 'DATE:'.
  wa_header-info = sy-datum.
  APPEND wa_header TO it_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
      i_logo             = 'LOGO'
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .
ENDFORM.                               "FORM top_of_page.
*"--------------------------------------------------------------------*
*FORM end_of_page.                                                    *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
*& TEXT *
*"&-------------------------------------------------------------------*
FORM end_of_page.
  CLEAR wa_header.
  REFRESH it_header.

  wa_header-typ = 'H'.
  wa_header-key = 'END OF PAGE'.
  wa_header-info = 'SUPPLIER DETAILS'.
  APPEND wa_header TO it_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_header
*     I_LOGO             =
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .
ENDFORM.                               "FORM end_of_page.
