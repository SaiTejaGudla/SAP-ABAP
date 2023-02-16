*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z3492_LIBRARY...................................*
DATA:  BEGIN OF STATUS_Z3492_LIBRARY                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_LIBRARY                 .
CONTROLS: TCTRL_Z3492_LIBRARY
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: Z3492_SCHOOL....................................*
DATA:  BEGIN OF STATUS_Z3492_SCHOOL                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_SCHOOL                  .
CONTROLS: TCTRL_Z3492_SCHOOL
            TYPE TABLEVIEW USING SCREEN '0003'.
*.........table declarations:.................................*
TABLES: *Z3492_LIBRARY                 .
TABLES: *Z3492_SCHOOL                  .
TABLES: Z3492_LIBRARY                  .
TABLES: Z3492_SCHOOL                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
