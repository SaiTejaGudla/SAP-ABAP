*&---------------------------------------------------------------------*
*& Include          Z1013492_ALV_MAIN_MARA
*&---------------------------------------------------------------------*

FORM u_command USING r_ucomm LIKE sy-ucomm
                     r_selfield TYPE slis_selfield.

 CASE r_ucomm.
   WHEN '&IC1'.

     READ TABLE it_vbap INTO wa_vbap INDEX r_selfield-tabindex.

     IF sy-subrc = 0.

       SELECT matnr
              laeda
              aenam
              vpsta
         FROM mara
         INTO TABLE it_mara
        WHERE matnr = wa_vbap-matnr.

     ELSE.

       MESSAGE 'Data Not Read' TYPE 'I'.
     ENDIF.

     IF sy-subrc = 0.

            PERFORM fieldcat_mara.

     ELSE.

       MESSAGE ' Data Not Fetched ' TYPE 'I'.

     ENDIF.
 ENDCASE.

 ENDFORM.

*&---------------------------------------------------------------------*
*& Form fieldcat_mara
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fieldcat_mara .
CLEAR wa_fcat.
REFRESH it_fcat.
REFRESH it_header.

wa_fcat-fieldname = 'MATNR'.
wa_fcat-col_pos   = 1.
wa_fcat-seltext_m = 'Material Number'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'LAEDA'.
wa_fcat-col_pos   = 4.
wa_fcat-seltext_m = 'Last Changed Date'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'AENAM'.
wa_fcat-col_pos   = 2.
wa_fcat-seltext_m = 'Name'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'VPSTA'.
wa_fcat-col_pos   = 3.
wa_fcat-seltext_m = 'Maintenance Status'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

gs_layout-colwidth_optimize = 'X'.


PERFORM call_function_mara.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form call_function_mara
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM call_function_mara .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
     I_BUFFER_ACTIVE                    = 'X'
     I_CALLBACK_PROGRAM                 = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
     I_CALLBACK_USER_COMMAND            = 'U_COMMAND1'
     I_CALLBACK_TOP_OF_PAGE             = 'LIST_HEADER'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
     IS_LAYOUT                          = gs_layout
     IT_FIELDCAT                        = it_fcat
*     IT_EXCLUDING                      =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT                           =
*     IT_FILTER                         =
*     IS_SEL_HIDE                       =
*     I_DEFAULT                         = 'X'
*     I_SAVE                            = ' '
*     IS_VARIANT                        =
*     IT_EVENTS                         =
*     IT_EVENT_EXIT                     =
*     IS_PRINT                          =
*     IS_REPREP_ID                      =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK                      =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER           =
*   IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab                          = it_mara
*   EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS                            = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.

FORM list_header.

  wa_header-typ  = 'S'.
  wa_header-info = 'Material Data'.
  APPEND wa_header to it_header.
  CLEAR wa_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary       = it_header
*     I_LOGO                   =
*     I_END_OF_LIST_GRID       =
*     I_ALV_FORM               =
            .
 ENDFORM.

 FORM u_command1 USING r_ucom LIKE sy-ucomm
                       r_selfield TYPE slis_selfield.

   CASE r_ucom.

     WHEN '&IC1'.

       READ TABLE it_mara INTO wa_mara INDEX r_selfield-tabindex.

       IF sy-subrc = 0 AND wa_mara-matnr IS NOT INITIAL.

       SET PARAMETER ID 'MAT' FIELD wa_mara-matnr.
       CALL TRANSACTION 'MM03' AND SKIP FIRST SCREEN.

       ENDIF.

      ENDCASE.

 ENDFORM.
