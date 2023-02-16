*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_PAYMENT................................*
DATA:  BEGIN OF STATUS_Z1013492_PAYMENT              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_PAYMENT              .
CONTROLS: TCTRL_Z1013492_PAYMENT
            TYPE TABLEVIEW USING SCREEN '0003'.
*.........table declarations:.................................*
TABLES: *Z1013492_PAYMENT              .
TABLES: Z1013492_PAYMENT               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
