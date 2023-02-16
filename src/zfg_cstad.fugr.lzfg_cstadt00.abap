*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_T_CSTAD................................*
DATA:  BEGIN OF STATUS_Z1013492_T_CSTAD              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_T_CSTAD              .
CONTROLS: TCTRL_Z1013492_T_CSTAD
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_T_CSTAD              .
TABLES: Z1013492_T_CSTAD               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
