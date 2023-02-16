*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TORDTRA................................*
DATA:  BEGIN OF STATUS_Z1013492_TORDTRA              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TORDTRA              .
CONTROLS: TCTRL_Z1013492_TORDTRA
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TORDTRA              .
TABLES: Z1013492_TORDTRA               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
