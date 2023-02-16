*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_O_ROOM.................................*
DATA:  BEGIN OF STATUS_Z1013492_O_ROOM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_O_ROOM               .
CONTROLS: TCTRL_Z1013492_O_ROOM
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_O_ROOM               .
TABLES: Z1013492_O_ROOM                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
