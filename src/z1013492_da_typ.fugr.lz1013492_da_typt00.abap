*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_DA_TYP.................................*
DATA:  BEGIN OF STATUS_Z1013492_DA_TYP               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_DA_TYP               .
CONTROLS: TCTRL_Z1013492_DA_TYP
            TYPE TABLEVIEW USING SCREEN '0003'.
*.........table declarations:.................................*
TABLES: *Z1013492_DA_TYP               .
TABLES: Z1013492_DA_TYP                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
