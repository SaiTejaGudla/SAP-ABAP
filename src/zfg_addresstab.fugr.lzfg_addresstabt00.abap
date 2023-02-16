*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_ADDRESS................................*
DATA:  BEGIN OF STATUS_Z1013492_ADDRESS              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_ADDRESS              .
CONTROLS: TCTRL_Z1013492_ADDRESS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_ADDRESS              .
TABLES: Z1013492_ADDRESS               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
