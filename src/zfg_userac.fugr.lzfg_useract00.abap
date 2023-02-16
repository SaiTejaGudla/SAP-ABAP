*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TUSERAC................................*
DATA:  BEGIN OF STATUS_Z1013492_TUSERAC              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TUSERAC              .
CONTROLS: TCTRL_Z1013492_TUSERAC
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TUSERAC              .
TABLES: Z1013492_TUSERAC               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
