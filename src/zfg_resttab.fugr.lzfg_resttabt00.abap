*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_RESTTAB................................*
DATA:  BEGIN OF STATUS_Z1013492_RESTTAB              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_RESTTAB              .
CONTROLS: TCTRL_Z1013492_RESTTAB
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_RESTTAB              .
TABLES: Z1013492_RESTTAB               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
