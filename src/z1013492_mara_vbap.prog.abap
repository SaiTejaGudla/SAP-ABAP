*&---------------------------------------------------------------------*
*& Report Z1013492_MARA_VBAP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MARA_VBAP.

TYPES: BEGIN OF ty_mara,
        matnr           TYPE mara-matnr,
        ersda           TYPE mara-ersda,
        time            TYPE mara-created_at_time,
        ernam           TYPE mara-ernam,
        laeda           TYPE mara-laeda,
       END OF ty_mara,

       BEGIN OF ty_vbap,
        vbeln TYPE vbap-vbeln,
        posnr TYPE vbap-posnr,
        matnr TYPE vbap-matnr,
        matwa TYPE vbap-matwa,
        pmatn TYPE vbap-pmatn,
       END OF ty_vbap.


 DATA: it_mara TYPE TABLE OF ty_mara,
       wa_mara TYPE ty_mara,

       it_vbap TYPE TABLE OF ty_vbap,
       wa_vbap TYPE ty_vbap,

       it_fcat TYPE slis_t_fieldcat_alv,
       wa_fcat TYPE slis_fieldcat_alv,

       g_matnr TYPE mara-matnr,

       g_field TYPE mara-matnr,

       g_value TYPE mara-matnr.

SELECT-OPTIONS: S_matnr for g_matnr.



SELECT matnr
       ersda
       created_at_time
       ernam
       laeda
  FROM mara
  INTO TABLE it_mara
 WHERE matnr in s_matnr.

wa_fcat-col_pos = 1.
wa_fcat-fieldname = 'MATNR'.
wa_fcat-seltext_m = 'Material Number'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-col_pos = 2.
wa_fcat-fieldname = 'ERSDA'.
wa_fcat-seltext_m = 'Created On'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-col_pos = 3.
wa_fcat-fieldname = 'TIME'.
wa_fcat-seltext_m = 'Time'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-col_pos = 4.
wa_fcat-fieldname = 'ERNAM'.
wa_fcat-seltext_m = 'Name of the Person'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-col_pos = 5.
wa_fcat-fieldname = 'LAEDA'.
wa_fcat-seltext_m = 'Last Changed Dates'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
    I_CALLBACK_PROGRAM                = sy-repid
    I_CALLBACK_PF_STATUS_SET          = 'Z1013492'
*    I_CALLBACK_USER_COMMAND           = 'U_COMM'
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT                         =
    IT_FIELDCAT                       = it_fcat
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
    t_outtab                          = it_mara
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

FORM Z1013492 USING rt_extab TYPE slis_t_extab.
  set PF-STATUS 'Z1013492_PF'.
ENDFORM.
*FORM u_comm USING r_ucomm TYPE sy-ucomm
*                  selfield TYPE slis_selfield.
*
*CASE r_ucomm.
*  WHEN '&IC1'.
*    READ TABLE it_mara INTO wa_mara INDEX selfield-tabindex.
*    IF sy-subrc = 0 and selfield-fieldname = 'MATNR'.
*       SELECT vbeln
*              posnr
*              matnr
*              matwa
*              pmatn
*         FROM vbap
*         INTO TABLE it_vbap
*        WHERE matnr = wa_mara-matnr.
*    ENDIF.
*ENDCASE.
*PERFORM it_vbap.
*ENDFORM.
**&---------------------------------------------------------------------*
**& Form it_vbap
**&---------------------------------------------------------------------*
**& text
**&---------------------------------------------------------------------*
**& -->  p1        text
**& <--  p2        text
**&---------------------------------------------------------------------*
*FORM it_vbap .
*
*
*CLEAR wa_fcat.
*REFRESH it_fcat.
*
*wa_fcat-col_pos = 1.
*wa_fcat-fieldname = 'vbeln'.
*wa_fcat-seltext_m = 'Sales Document'.
*APPEND wa_fcat to it_fcat.
*CLEAR wa_fcat.
*
*wa_fcat-col_pos = 2.
*wa_fcat-fieldname = 'posnr'.
*wa_fcat-seltext_m = 'Sales Item'.
*APPEND wa_fcat to it_fcat.
*CLEAR wa_fcat.
*
*wa_fcat-col_pos = 3.
*wa_fcat-fieldname = 'matnr'.
*wa_fcat-seltext_m = 'Material Number'.
*APPEND wa_fcat to it_fcat.
*CLEAR wa_fcat.
*
*wa_fcat-col_pos = 4.
*wa_fcat-fieldname = 'matwa'.
*wa_fcat-seltext_m = 'Material Entered'.
*APPEND wa_fcat to it_fcat.
*CLEAR wa_fcat.
*
*wa_fcat-col_pos = 5.
*wa_fcat-fieldname = 'pmatn'.
*wa_fcat-seltext_m = 'Pricing Reference Materail'.
*APPEND wa_fcat to it_fcat.
*CLEAR wa_fcat.
*
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
* EXPORTING
**   I_INTERFACE_CHECK                 = ' '
**   I_BYPASSING_BUFFER                = ' '
**   I_BUFFER_ACTIVE                   = ' '
*    I_CALLBACK_PROGRAM                = sy-repid
**   I_CALLBACK_PF_STATUS_SET          = ' '
**   I_CALLBACK_USER_COMMAND           = ' '
**   I_CALLBACK_TOP_OF_PAGE            = ' '
**   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
**   I_CALLBACK_HTML_END_OF_LIST       = ' '
**   I_STRUCTURE_NAME                  =
**   I_BACKGROUND_ID                   = ' '
**   I_GRID_TITLE                      =
**   I_GRID_SETTINGS                   =
**   IS_LAYOUT                         =
*    IT_FIELDCAT                       = it_fcat
**   IT_EXCLUDING                      =
**   IT_SPECIAL_GROUPS                 =
**   IT_SORT                           =
**   IT_FILTER                         =
**   IS_SEL_HIDE                       =
**   I_DEFAULT                         = 'X'
**   I_SAVE                            = ' '
**   IS_VARIANT                        =
**   IT_EVENTS                         =
**   IT_EVENT_EXIT                     =
**   IS_PRINT                          =
**   IS_REPREP_ID                      =
**   I_SCREEN_START_COLUMN             = 0
**   I_SCREEN_START_LINE               = 0
**   I_SCREEN_END_COLUMN               = 0
**   I_SCREEN_END_LINE                 = 0
**   I_HTML_HEIGHT_TOP                 = 0
**   I_HTML_HEIGHT_END                 = 0
**   IT_ALV_GRAPHICS                   =
**   IT_HYPERLINK                      =
**   IT_ADD_FIELDCAT                   =
**   IT_EXCEPT_QINFO                   =
**   IR_SALV_FULLSCREEN_ADAPTER        =
**   O_PREVIOUS_SRAL_HANDLER           =
** IMPORTING
**   E_EXIT_CAUSED_BY_CALLER           =
**   ES_EXIT_CAUSED_BY_USER            =
*  TABLES
*    t_outtab                          = it_vbap
** EXCEPTIONS
**   PROGRAM_ERROR                     = 1
**   OTHERS                            = 2
*          .
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.
*ENDFORM.

AT LINE-SELECTION.
GET CURSOR FIELD g_field VALUE g_value.

       SELECT vbeln
              posnr
              matnr
              matwa
              pmatn
         FROM vbap
         INTO TABLE it_vbap
        WHERE matnr = wa_mara-matnr.

*LOOP AT it_vbap INTO wa_vbap.
*
*WRITE:/ wa_vbap-vbeln,
*        wa_vbap-posnr,
*        wa_vbap-matnr,
*        wa_vbap-matwa,
*        wa_vbap-pmatn.
*ENDLOOP.

CLEAR wa_fcat.
REFRESH it_fcat.

wa_fcat-col_pos = 1.
wa_fcat-fieldname = 'vbeln'.
wa_fcat-seltext_m = 'Sales Document'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-col_pos = 2.
wa_fcat-fieldname = 'posnr'.
wa_fcat-seltext_m = 'Sales Item'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-col_pos = 3.
wa_fcat-fieldname = 'matnr'.
wa_fcat-seltext_m = 'Material Number'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-col_pos = 4.
wa_fcat-fieldname = 'matwa'.
wa_fcat-seltext_m = 'Material Entered'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-col_pos = 5.
wa_fcat-fieldname = 'pmatn'.
wa_fcat-seltext_m = 'Pricing Reference Materail'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
    I_CALLBACK_PROGRAM                = sy-repid
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT                         =
    IT_FIELDCAT                       = it_fcat
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
    t_outtab                          = it_vbap
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
*ENDFORM.
