*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TMERCHA................................*
DATA:  BEGIN OF STATUS_Z1013492_TMERCHA              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TMERCHA              .
CONTROLS: TCTRL_Z1013492_TMERCHA
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TMERCHA              .
TABLES: Z1013492_TMERCHA               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
