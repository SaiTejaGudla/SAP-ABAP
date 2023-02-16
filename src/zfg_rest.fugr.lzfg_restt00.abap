*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z3492_RESTTAB...................................*
DATA:  BEGIN OF STATUS_Z3492_RESTTAB                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_RESTTAB                 .
CONTROLS: TCTRL_Z3492_RESTTAB
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z3492_RESTTAB                 .
TABLES: Z3492_RESTTAB                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
