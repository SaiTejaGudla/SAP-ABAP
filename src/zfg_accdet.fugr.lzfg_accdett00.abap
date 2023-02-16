*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_ACCDET.................................*
DATA:  BEGIN OF STATUS_Z1013492_ACCDET               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_ACCDET               .
CONTROLS: TCTRL_Z1013492_ACCDET
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_ACCDET               .
TABLES: Z1013492_ACCDET                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
