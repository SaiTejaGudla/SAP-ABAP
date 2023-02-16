*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_USERTAB................................*
DATA:  BEGIN OF STATUS_Z1013492_USERTAB              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_USERTAB              .
CONTROLS: TCTRL_Z1013492_USERTAB
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_USERTAB              .
TABLES: Z1013492_USERTAB               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
