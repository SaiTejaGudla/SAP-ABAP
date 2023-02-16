*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TOFFER.................................*
DATA:  BEGIN OF STATUS_Z1013492_TOFFER               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TOFFER               .
CONTROLS: TCTRL_Z1013492_TOFFER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TOFFER               .
TABLES: Z1013492_TOFFER                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
