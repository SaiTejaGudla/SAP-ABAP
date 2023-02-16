*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZCLGCODES.......................................*
DATA:  BEGIN OF STATUS_ZCLGCODES                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCLGCODES                     .
CONTROLS: TCTRL_ZCLGCODES
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *ZCLGCODES                     .
TABLES: ZCLGCODES                      .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
