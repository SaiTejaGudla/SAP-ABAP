*&---------------------------------------------------------------------*
*& Include          Z1013492_AMAZON_DISPLAY
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form call_fucntion
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM call_fucntion .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
   I_BUFFER_ACTIVE                    = 'X'
   I_CALLBACK_PROGRAM                 = sy-repid
*   I_CALLBACK_PF_STATUS_SET          = ' '
   I_CALLBACK_USER_COMMAND            = 'USER_COMMAND'
   I_CALLBACK_TOP_OF_PAGE             = 'LIST_HEADER'
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
   IS_LAYOUT                          = gs_layout
   IT_FIELDCAT                        = it_fcat
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT                           =
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   I_SAVE                            = ' '
*   IS_VARIANT                        =
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT                          =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
*   O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = it_amazon
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

ENDFORM.

FORM list_header.

  wa_header-typ  = 'S'.
  wa_header-info = 'AMAZON USER DETAILS'.
  APPEND wa_header to it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
  EXPORTING
    it_list_commentary       = it_header.
*   I_LOGO                   =
*   I_END_OF_LIST_GRID       =
*   I_ALV_FORM               =

ENDFORM.

*&---------------------------------------------------------------------*
**& Form user_command
**&---------------------------------------------------------------------*
**& text
**&---------------------------------------------------------------------*
**& -->  p1        text
**& <--  p2        text
**&---------------------------------------------------------------------*
FORM user_command USING r_ucomm LIKE sy-ucomm
                        r_selfield TYPE slis_selfield.

  CASE r_ucomm.
    WHEN '&DATA_SAVE'.

      READ TABLE it_amazon INTO wa_amazon INDEX r_selfield-tabindex.
     IF sy-subrc = 0.
       MODIFY z1013492_tuser FROM wa_amazon.
     ENDIF.
     IF sy-subrc = 0.
       MESSAGE 'Data Updates Successfully' TYPE 'S'.
     ENDIF.

  ENDCASE.

ENDFORM.
