*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_MENUTAB................................*
DATA:  BEGIN OF STATUS_Z1013492_MENUTAB              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_MENUTAB              .
CONTROLS: TCTRL_Z1013492_MENUTAB
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_MENUTAB              .
TABLES: Z1013492_MENUTAB               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
