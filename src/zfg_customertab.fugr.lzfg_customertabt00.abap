*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_CUSTOM.................................*
DATA:  BEGIN OF STATUS_Z1013492_CUSTOM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_CUSTOM               .
CONTROLS: TCTRL_Z1013492_CUSTOM
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_CUSTOM               .
TABLES: Z1013492_CUSTOM                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
