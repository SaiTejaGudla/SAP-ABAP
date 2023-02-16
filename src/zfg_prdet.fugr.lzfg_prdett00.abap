*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TPRDET.................................*
DATA:  BEGIN OF STATUS_Z1013492_TPRDET               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TPRDET               .
CONTROLS: TCTRL_Z1013492_TPRDET
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TPRDET               .
TABLES: Z1013492_TPRDET                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
