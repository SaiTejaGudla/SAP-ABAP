*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_T_ATMAS................................*
DATA:  BEGIN OF STATUS_Z1013492_T_ATMAS              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_T_ATMAS              .
CONTROLS: TCTRL_Z1013492_T_ATMAS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_T_ATMAS              .
TABLES: Z1013492_T_ATMAS               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
