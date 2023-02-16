*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z3492_STUDENT...................................*
DATA:  BEGIN OF STATUS_Z3492_STUDENT                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_STUDENT                 .
CONTROLS: TCTRL_Z3492_STUDENT
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z3492_STUDENT                 .
TABLES: Z3492_STUDENT                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
