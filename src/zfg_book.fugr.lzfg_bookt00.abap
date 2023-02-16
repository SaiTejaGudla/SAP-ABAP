*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_O_BOOK.................................*
DATA:  BEGIN OF STATUS_Z1013492_O_BOOK               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_O_BOOK               .
CONTROLS: TCTRL_Z1013492_O_BOOK
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_O_BOOK               .
TABLES: Z1013492_O_BOOK                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
