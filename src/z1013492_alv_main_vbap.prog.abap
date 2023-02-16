*&---------------------------------------------------------------------*
*& Include          Z1013492_ALV_MAIN_VBAP
*&---------------------------------------------------------------------*

FORM user_command USING r_ucomm LIKE sy-ucomm
                        r_selfield TYPE slis_selfield.

  CASE r_ucomm.

    WHEN '&IC1'.

  READ TABLE it_vbak INTO wa_vbak INDEX r_selfield-tabindex.

      IF sy-subrc = 0.

        SELECT posnr
               matnr
               matwa
          FROM vbap
          INTO TABLE it_vbap
          WHERE vbeln = wa_vbak-vbeln.
      ELSE.
        MESSAGE 'Data Not Read' TYPE 'I'.
      ENDIF.

      IF sy-subrc = 0.

        CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
          EXPORTING
            formname                 = 'Z1013492_VBAK_VBAP'
*           VARIANT                  = ' '
*           DIRECT_CALL              = ' '
         IMPORTING
            FM_NAME                  = G_NAME.
*         EXCEPTIONS
*           NO_FORM                  = 1
*           NO_FUNCTION_MODULE       = 2
*           OTHERS                   = 3
 IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

 CALL FUNCTION G_NAME
  EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
    p_vbeln                    = wa_vbak-vbeln
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
* EXCEPTIONS
*   FORMATTING_ERROR           = 1
*   INTERNAL_ERROR             = 2
*   SEND_ERROR                 = 3
*   USER_CANCELED              = 4
*   OTHERS                     = 5
          .

        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.


*          PERFORM fieldcat_vbap.

      ELSE.
        MESSAGE 'Data Not Fetched' TYPE 'I'.

       ENDIF.
       ENDCASE.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form fieldcat_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
*FORM fieldcat_vbap .
*
*CLEAR wa_fcat.
*REFRESH it_fcat.
*REFRESH it_header.
*
*
*wa_fcat-fieldname = 'POSNR'.
*wa_fcat-col_pos   = 1.
*wa_fcat-seltext_m   = 'Document Item'.
*APPEND wa_fcat to it_fcat.
*CLEAR wa_fcat.
*
*wa_fcat-fieldname = 'MATNR'.
*wa_fcat-col_pos   = 2.
*wa_fcat-seltext_m  = 'Material Number'.
*APPEND wa_fcat to it_fcat.
*CLEAR wa_fcat.
*
*wa_fcat-fieldname = 'MATWA'.
*wa_fcat-col_pos   = 3.
*wa_fcat-seltext_m   = 'Material Entered'.
*APPEND wa_fcat to it_fcat.
*CLEAR wa_fcat.
*
*gs_layout-colwidth_optimize = 'X'.
*
*PERFORM call_function_vbap.
*
*ENDFORM.


*&---------------------------------------------------------------------*
*& Form call_function_vbap
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
*FORM call_function_vbap .
*
*  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*   EXPORTING
**     I_INTERFACE_CHECK                 = ' '
**     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                    = 'X'
*     I_CALLBACK_PROGRAM                 = sy-repid
**     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND            = 'U_COMMAND'
*     I_CALLBACK_TOP_OF_PAGE             = 'SALES_ITEM'
**     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
**     I_CALLBACK_HTML_END_OF_LIST       = ' '
**     I_STRUCTURE_NAME                  =
**     I_BACKGROUND_ID                   = ' '
**     I_GRID_TITLE                      =
**     I_GRID_SETTINGS                   =
*     IS_LAYOUT                          = gs_layout
*     IT_FIELDCAT                        = it_fcat
**     IT_EXCLUDING                      =
**     IT_SPECIAL_GROUPS                 =
**     IT_SORT                           =
**     IT_FILTER                         =
**     IS_SEL_HIDE                       =
**     I_DEFAULT                         = 'X'
**     I_SAVE                            = ' '
**     IS_VARIANT                        =
**     IT_EVENTS                         =
**     IT_EVENT_EXIT                     =
**     IS_PRINT                          =
**     IS_REPREP_ID                      =
**     I_SCREEN_START_COLUMN             = 0
**     I_SCREEN_START_LINE               = 0
**     I_SCREEN_END_COLUMN               = 0
**     I_SCREEN_END_LINE                 = 0
**     I_HTML_HEIGHT_TOP                 = 0
**     I_HTML_HEIGHT_END                 = 0
**     IT_ALV_GRAPHICS                   =
**     IT_HYPERLINK                      =
**     IT_ADD_FIELDCAT                   =
**     IT_EXCEPT_QINFO                   =
**     IR_SALV_FULLSCREEN_ADAPTER        =
**     O_PREVIOUS_SRAL_HANDLER           =
**   IMPORTING
**     E_EXIT_CAUSED_BY_CALLER           =
**     ES_EXIT_CAUSED_BY_USER            =
*    TABLES
*      t_outtab                          = it_vbap
**   EXCEPTIONS
**     PROGRAM_ERROR                     = 1
**     OTHERS                            = 2
*            .
*  IF sy-subrc <> 0.
** Implement suitable error handling here
*  ENDIF.


*ENDFORM.
*
*FORM sales_item.
*
*  wa_header-typ  = 'S'.
*  wa_header-info = 'Sales Item Data'.
*  APPEND wa_header to it_header.
*  CLEAR wa_header.
*
*  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
*    EXPORTING
*      it_list_commentary       = it_header
**     I_LOGO                   =
**     I_END_OF_LIST_GRID       =
**     I_ALV_FORM               =
*            .
*
*ENDFORM.
