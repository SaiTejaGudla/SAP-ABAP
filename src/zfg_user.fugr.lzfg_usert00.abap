*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TUSER..................................*
DATA:  BEGIN OF STATUS_Z1013492_TUSER                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TUSER                .
CONTROLS: TCTRL_Z1013492_TUSER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TUSER                .
TABLES: Z1013492_TUSER                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
