*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TRANSAC................................*
DATA:  BEGIN OF STATUS_Z1013492_TRANSAC              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TRANSAC              .
CONTROLS: TCTRL_Z1013492_TRANSAC
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TRANSAC              .
TABLES: Z1013492_TRANSAC               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
