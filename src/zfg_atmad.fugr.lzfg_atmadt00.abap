*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_T_ATMAD................................*
DATA:  BEGIN OF STATUS_Z1013492_T_ATMAD              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_T_ATMAD              .
CONTROLS: TCTRL_Z1013492_T_ATMAD
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_T_ATMAD              .
TABLES: Z1013492_T_ATMAD               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
