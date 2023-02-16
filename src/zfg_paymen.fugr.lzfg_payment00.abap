*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TPAYMEN................................*
DATA:  BEGIN OF STATUS_Z1013492_TPAYMEN              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TPAYMEN              .
CONTROLS: TCTRL_Z1013492_TPAYMEN
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TPAYMEN              .
TABLES: Z1013492_TPAYMEN               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
