*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TWARE..................................*
DATA:  BEGIN OF STATUS_Z1013492_TWARE                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TWARE                .
CONTROLS: TCTRL_Z1013492_TWARE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TWARE                .
TABLES: Z1013492_TWARE                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
