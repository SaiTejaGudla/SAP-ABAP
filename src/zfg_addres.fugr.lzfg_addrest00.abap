*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TADDRES................................*
DATA:  BEGIN OF STATUS_Z1013492_TADDRES              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TADDRES              .
CONTROLS: TCTRL_Z1013492_TADDRES
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TADDRES              .
TABLES: Z1013492_TADDRES               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
