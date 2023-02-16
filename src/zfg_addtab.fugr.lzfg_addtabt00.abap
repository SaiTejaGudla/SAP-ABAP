*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_ADDTAB.................................*
DATA:  BEGIN OF STATUS_Z1013492_ADDTAB               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_ADDTAB               .
CONTROLS: TCTRL_Z1013492_ADDTAB
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_ADDTAB               .
TABLES: Z1013492_ADDTAB                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
