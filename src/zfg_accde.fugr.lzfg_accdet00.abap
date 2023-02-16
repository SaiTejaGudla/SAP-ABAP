*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TACCDE.................................*
DATA:  BEGIN OF STATUS_Z1013492_TACCDE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TACCDE               .
CONTROLS: TCTRL_Z1013492_TACCDE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TACCDE               .
TABLES: Z1013492_TACCDE                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
