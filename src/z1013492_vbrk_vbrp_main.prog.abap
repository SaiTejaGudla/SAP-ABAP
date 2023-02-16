*&---------------------------------------------------------------------*
*& Include          Z1013492_VBRK_VBRP_MAIN
*&---------------------------------------------------------------------*

SELECT VK~vbeln
       VK~fkart
       VK~fktyp
       VK~vbtyp
       VK~waerk
       VK~vkorg
  FROM vbrk AS VK
  INTO TABLE it_vbrk
 WHERE VK~vbeln in s_vbeln.

IF sy-subrc <> 0 and it_vbrk is  INITIAL.
  MESSAGE ' Data Not Fetched ' TYPE 'I'.
ELSE.
SELECT VP~vbeln
       VP~posnr
       VP~uepos
       VP~fkimg
       VP~vrkme
       VP~aubel
  FROM vbrp AS VP
  INTO TABLE it_vbrp
   FOR ALL ENTRIES IN it_vbrk
 WHERE VP~vbeln = it_vbrk-vbeln.

IF SY-SUBRC <> 0 AND IT_VBRP IS INITIAL.

MESSAGE 'VBRP DATA NOT FETCHED' TYPE 'I'.

ELSEIF IT_VBRP IS NOT INITIAL.

  LOOP AT IT_VBRP INTO WA_VBRP.

   READ TABLE IT_VBRK INTO WA_VBRK WITH KEY VBELN = WA_VBRP-VBELN.

    wa_final-vbeln = wa_vbrk-vbeln.
    wa_final-fkart = wa_vbrk-fkart.
    wa_final-fktyp = wa_vbrk-fktyp.
    wa_final-vbtyp = wa_vbrk-vbtyp.
    wa_final-waerk = wa_vbrk-waerk.
    wa_final-vkorg = wa_vbrk-vkorg.
    wa_final-posnr = wa_vbrp-posnr.
    wa_final-uepos = wa_vbrp-uepos.
    wa_final-vrkme = wa_vbrp-vrkme.
    wa_final-aubel = wa_vbrp-aubel.
    APPEND WA_FINAL TO IT_FINAL.
    CLEAR WA_FINAL.
  ENDLOOP.
  IF sy-subrc = 0.
    PERFORM get_data.
    PERFORM display_data.
  ENDIF.
ENDIF.
ENDIF.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .
 wa_fcat-col_pos = 1.
 wa_fcat-fieldname = 'VBELN'.
 wa_fcat-seltext_l = 'Billing Document Number'.
 wa_fcat-outputlen = '50'.
 APPEND wa_fcat to it_fcat.


 wa_fcat-col_pos = 2.
 wa_fcat-fieldname = 'FKART'.
 wa_fcat-seltext_m = 'Billing Type'.
 APPEND wa_fcat TO it_fcat.


 wa_fcat-col_pos = 3.
 wa_fcat-fieldname = 'FKTYP'.
 wa_fcat-seltext_m = 'Billing Category'.
 APPEND wa_fcat TO it_fcat.


 wa_fcat-col_pos = 4.
 wa_fcat-fieldname = 'VBTYP'.
 wa_fcat-seltext_m = 'SD Document Category'.
 APPEND wa_fcat TO it_fcat.


 wa_fcat-col_pos = 5.
 wa_fcat-fieldname = 'WAERK'.
 wa_fcat-seltext_m = 'SD Document Currency'.
 APPEND wa_fcat TO it_fcat.

 wa_fcat-col_pos = 6.
 wa_fcat-fieldname = 'VKORG'.
 wa_fcat-seltext_m = 'Sales Organization'.
 APPEND wa_fcat TO it_fcat.

 wa_fcat-col_pos = 7.
 wa_fcat-fieldname = 'POSNR'.
 wa_fcat-seltext_m = 'Billing Item'.
 APPEND wa_fcat TO it_fcat.

 wa_fcat-col_pos = 8.
 wa_fcat-fieldname = 'UEPOS'.
 wa_fcat-seltext_m = 'Material Structures'.
 APPEND wa_fcat TO it_fcat.

 wa_fcat-col_pos = 9.
 wa_fcat-fieldname = 'VRKME'.
 wa_fcat-seltext_m = 'Sales unit'.
 APPEND wa_fcat TO it_fcat.

 wa_fcat-col_pos = 10.
 wa_fcat-fieldname = 'AUBEL'.
 wa_fcat-seltext_m = 'Sales dcoument'.
 APPEND wa_fcat TO it_fcat.

 "gs_layout-colwidth_optimize = 'X'.
 gs_layout-zebra = 'X'.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_data .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
      I_CALLBACK_PROGRAM                = SY-REPID
*     I_CALLBACK_PF_STATUS_SET          = ' '
      I_CALLBACK_USER_COMMAND           = 'U_COMMAND'
      I_CALLBACK_TOP_OF_PAGE            = 'LIST_HEADER'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
      IS_LAYOUT                         = GS_LAYOUT
      IT_FIELDCAT                       = IT_FCAT
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
      t_outtab                          = IT_FINAL
*   EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS                            = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

ENDFORM.
FORM LIST_HEADER.

  WA_HEADER-TYP = 'H'.
  wa_header-INFO = 'BILLING DOCUMENT DATA'.
  APPEND wa_header to it_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary       = it_header
*     I_LOGO                   =
*     I_END_OF_LIST_GRID       =
*     I_ALV_FORM               =
            .
  CLEAR WA_HEADER.
  REFRESH IT_HEADER.
 ENDFORM.
FORM u_command USING r_ucomm TYPE sy-ucomm
                     r_selfield TYPE slis_selfield.

 CASE r_ucomm.
   WHEN '&IC1'.
     SET PARAMETER ID 'AUN' FIELD wa_final-aubel.
     CALL TRANSACTION 'VA03' AND SKIP FIRST SCREEN.
 ENDCASE.
 ENDFORM.
