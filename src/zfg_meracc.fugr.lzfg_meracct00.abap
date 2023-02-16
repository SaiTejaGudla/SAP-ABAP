*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TMERACC................................*
DATA:  BEGIN OF STATUS_Z1013492_TMERACC              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TMERACC              .
CONTROLS: TCTRL_Z1013492_TMERACC
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TMERACC              .
TABLES: Z1013492_TMERACC               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
