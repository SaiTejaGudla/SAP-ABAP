*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TCATDET................................*
DATA:  BEGIN OF STATUS_Z1013492_TCATDET              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TCATDET              .
CONTROLS: TCTRL_Z1013492_TCATDET
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TCATDET              .
TABLES: Z1013492_TCATDET               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
