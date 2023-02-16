*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_O_HOTEL................................*
DATA:  BEGIN OF STATUS_Z1013492_O_HOTEL              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_O_HOTEL              .
CONTROLS: TCTRL_Z1013492_O_HOTEL
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: Z1013492_T_BRNCH................................*
DATA:  BEGIN OF STATUS_Z1013492_T_BRNCH              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_T_BRNCH              .
CONTROLS: TCTRL_Z1013492_T_BRNCH
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_O_HOTEL              .
TABLES: *Z1013492_T_BRNCH              .
TABLES: Z1013492_O_HOTEL               .
TABLES: Z1013492_T_BRNCH               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
