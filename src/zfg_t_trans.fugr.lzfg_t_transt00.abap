*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_T_TRANS................................*
DATA:  BEGIN OF STATUS_Z1013492_T_TRANS              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_T_TRANS              .
CONTROLS: TCTRL_Z1013492_T_TRANS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_T_TRANS              .
TABLES: Z1013492_T_TRANS               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
