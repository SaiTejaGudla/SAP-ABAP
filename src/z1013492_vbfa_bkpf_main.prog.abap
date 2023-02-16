*&---------------------------------------------------------------------*
*& Include          Z1013492_VBFA_BKPF_MAIN
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form get_vbfa_bkpf
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_vbfa_bkpf .

  SELECT vbelv
         posnv
         vbeln
         posnn
         vbtyp_n
    FROM vbfa
    INTO TABLE it_vbfa
   WHERE vbeln IN s_vbeln
     AND posnn IN s_posnn
     AND vbtyp_n = 'P' OR vbtyp_n = 'R'.
 IF sy-subrc = 0 and it_vbfa is NOT INITIAL.

    SELECT bukrs
           belnr
           blart
           bldat
           budat
           xblnr
   FROM bkpf INTO TABLE it_bkpf
   FOR ALL ENTRIES IN it_vbfa
   WHERE belnr = it_vbfa-vbeln.

IF sy-subrc = 0 AND it_bkpf IS NOT INITIAL.

LOOP AT it_bkpf INTO wa_bkpf.

  READ TABLE it_vbfa INTO wa_vbfa WITH KEY vbeln = wa_bkpf-belnr.
  IF sy-subrc = 0.

     wa_final-vbelv   = wa_vbfa-vbelv.
     wa_final-posnv   = wa_vbfa-posnv.
     wa_final-vbeln   = wa_vbfa-vbeln.
     wa_final-posnn   = wa_vbfa-posnn.
     wa_final-vbtyp_n = wa_vbfa-vbtyp_n.
     wa_final-bukrs   = wa_bkpf-bukrs.
     wa_final-belnr   = wa_bkpf-belnr.
     wa_final-blart   = wa_bkpf-blart.
     wa_final-bldat   = wa_bkpf-bldat.
     wa_final-budat   = wa_bkpf-budat.
     wa_final-xblnr   = wa_bkpf-xblnr.
     APPEND wa_final to it_final.
  ENDIF.
  ENDLOOP.
ENDIF.
 ENDIF.
 PERFORM fieldcat.
 PERFORM display.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form fieldcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fieldcat .

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'VBELV'.
  wa_fcat-seltext_m = 'sales and distribution'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'POSNV'.
  wa_fcat-seltext_m = 'Item of an SD Document'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'VBELN'.
  wa_fcat-seltext_m = 'Subsequent Sales and Distribution'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'POSNN'.
  wa_fcat-seltext_m = 'SD Document Currency'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 5.
  wa_fcat-fieldname = 'VBTYP_N'.
  wa_fcat-seltext_m = 'Document Category of Subsequent Document'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 6.
  wa_fcat-fieldname = 'BUKRS'.
  wa_fcat-seltext_m = 'Company Code'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 7.
  wa_fcat-fieldname = 'BELNR'.
  wa_fcat-seltext_m = 'Accounting Document Number'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 8.
  wa_fcat-fieldname = 'BLART'.
  wa_fcat-seltext_m = 'Document Type'.
  APPEND wa_fcat TO it_fcat.

  wa_fcat-col_pos = 9.
  wa_fcat-fieldname = 'BLDAT'.
  wa_fcat-seltext_m = 'Document Date in Document'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 10.
  wa_fcat-fieldname = 'BUDAT'.
  wa_fcat-seltext_m = 'Posting Date'.
  APPEND wa_fcat TO it_fcat.


  wa_fcat-col_pos = 11.
  wa_fcat-fieldname = 'XBLNR'.
  wa_fcat-seltext_m = 'Reference Document Number'.
  APPEND wa_fcat TO it_fcat.


  gs_layout-colwidth_optimize = 'X'.
  gs_layout-zebra = 'X'.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form display
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display .

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
    IS_LAYOUT                         = gs_layout
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
    t_outtab                          = it_final
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

ENDFORM.
