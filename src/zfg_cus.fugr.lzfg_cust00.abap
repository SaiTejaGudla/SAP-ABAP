*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_O_CUST.................................*
DATA:  BEGIN OF STATUS_Z1013492_O_CUST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_O_CUST               .
CONTROLS: TCTRL_Z1013492_O_CUST
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_O_CUST               .
TABLES: Z1013492_O_CUST                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
