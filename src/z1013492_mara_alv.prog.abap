*&---------------------------------------------------------------------*
*& Report Z1013492_MARA_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_MARA_ALV.

TYPE-POOLS: slis.

TYPES: BEGIN OF ty_mara,
       matnr TYPE mara-matnr,
       ersda TYPE mara-ersda,
       mtart TYPE mara-mtart,
       mbrsh TYPE mara-mbrsh,
       meins TYPE mara-meins,
      END OF ty_mara.

DATA: it_mara TYPE TABLE OF ty_mara,
      wa_mara TYPE ty_mara.

SELECT matnr
       ersda
       mtart
       mbrsh
       meins
  FROM mara
  INTO TABLE it_mara.

*LOOP AT it_mara INTO wa_mara.
* WRITE:/ wa_mara-matnr,
*         wa_mara-ersda,
*         wa_mara-mtart,
*         wa_mara-mbrsh,
*         wa_mara-meins.
*ENDLOOP.

DATA: it_fcat TYPE slis_t_fieldcat_alv,
      wa_fcat LIKE line OF it_fcat.


wa_fcat-fieldname = 'MATNR'.
wa_fcat-col_pos   = '1'.
wa_fcat-seltext_m = 'Material No'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'ERSDA'.
wa_fcat-col_pos   = '2'.
wa_fcat-seltext_m = 'Created On'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'MTART'.
wa_fcat-col_pos   = '3'.
wa_fcat-seltext_m = 'Material Type'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'MBRSH'.
wa_fcat-col_pos   = '4'.
wa_fcat-seltext_m = 'Sector'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'MEINS'.
wa_fcat-col_pos   = '5'.
wa_fcat-seltext_m = 'Base Unit'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.



CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
*   I_CALLBACK_PROGRAM                = ' '
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
    t_outtab                          = it_mara
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
