*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_T_CARDM................................*
DATA:  BEGIN OF STATUS_Z1013492_T_CARDM              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_T_CARDM              .
CONTROLS: TCTRL_Z1013492_T_CARDM
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_T_CARDM              .
TABLES: Z1013492_T_CARDM               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
