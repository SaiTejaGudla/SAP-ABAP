*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_FOODTAB................................*
DATA:  BEGIN OF STATUS_Z1013492_FOODTAB              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_FOODTAB              .
CONTROLS: TCTRL_Z1013492_FOODTAB
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_FOODTAB              .
TABLES: Z1013492_FOODTAB               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
