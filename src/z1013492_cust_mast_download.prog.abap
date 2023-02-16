*&---------------------------------------------------------------------*
*& Report Z1013492_CUST_MAST_DOWNLOAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_CUST_MAST_DOWNLOAD.

TABLES: sscrfields.

TYPES: BEGIN OF ty_cust,
       Cust_no TYPE KUNNR,
       Country TYPE LAND1,
       Name    TYPE NAME1,
       City    TYPE ORT01,
       END OF ty_cust.

DATA: it_cust TYPE TABLE OF ty_cust,
      wa_cust TYPE ty_cust,
      g_field TYPE kna1-land1,
      g_file TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK Blk WITH FRAME TITLE t1.
  SELECTION-SCREEN COMMENT 2(20) com1.
  PARAMETERS: p_cnt TYPE kna1-land1.
  SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON:2(15) p_down USER-COMMAND click1.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK Blk.

INITIALIZATION.
 t1 = ' Getting the Customer Details '.
 com1 = ' Enter The Country Name '.
 p_down = 'DOWNLOAD'.

AT SELECTION-SCREEN ON p_cnt.

  SELECT SINGLE land1 FROM kna1
    INTO g_field WHERE land1 = p_cnt.
  IF sy-subrc <> 0.
    MESSAGE ' Invalid Data ' TYPE 'E'.
  ENDIF.

  START-OF-SELECTION.

  SELECT kunnr
         land1
         name1
         ort01
    FROM kna1
    INTO TABLE it_cust
   WHERE kunnr = p_cnt.


CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
*   BIN_FILESIZE                    =
    filename                        = g_file
    FILETYPE                        = 'DAT'
*   APPEND                          = ' '
*   WRITE_FIELD_SEPARATOR           = ' '
*   HEADER                          = '00'
*   TRUNC_TRAILING_BLANKS           = ' '
*   WRITE_LF                        = 'X'
*   COL_SELECT                      = ' '
*   COL_SELECT_MASK                 = ' '
*   DAT_MODE                        = ' '
*   CONFIRM_OVERWRITE               = ' '
*   NO_AUTH_CHECK                   = ' '
*   CODEPAGE                        = ' '
*   IGNORE_CERR                     = ABAP_TRUE
*   REPLACEMENT                     = '#'
*   WRITE_BOM                       = ' '
*   TRUNC_TRAILING_BLANKS_EOL       = 'X'
*   WK1_N_FORMAT                    = ' '
*   WK1_N_SIZE                      = ' '
*   WK1_T_FORMAT                    = ' '
*   WK1_T_SIZE                      = ' '
*   WRITE_LF_AFTER_LAST_LINE        = ABAP_TRUE
*   SHOW_TRANSFER_STATUS            = ABAP_TRUE
*   VIRUS_SCAN_PROFILE              = '/SCET/GUI_DOWNLOAD'
* IMPORTING
*   FILELENGTH                      =
  tables
    data_tab                        = it_cust
*   FIELDNAMES                      =
* EXCEPTIONS
*   FILE_WRITE_ERROR                = 1
*   NO_BATCH                        = 2
*   GUI_REFUSE_FILETRANSFER         = 3
*   INVALID_TYPE                    = 4
*   NO_AUTHORITY                    = 5
*   UNKNOWN_ERROR                   = 6
*   HEADER_NOT_ALLOWED              = 7
*   SEPARATOR_NOT_ALLOWED           = 8
*   FILESIZE_NOT_ALLOWED            = 9
*   HEADER_TOO_LONG                 = 10
*   DP_ERROR_CREATE                 = 11
*   DP_ERROR_SEND                   = 12
*   DP_ERROR_WRITE                  = 13
*   UNKNOWN_DP_ERROR                = 14
*   ACCESS_DENIED                   = 15
*   DP_OUT_OF_MEMORY                = 16
*   DISK_FULL                       = 17
*   DP_TIMEOUT                      = 18
*   FILE_NOT_FOUND                  = 19
*   DATAPROVIDER_EXCEPTION          = 20
*   CONTROL_FLUSH_ERROR             = 21
*   OTHERS                          = 22
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
