*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z3492_PRACTICE..................................*
DATA:  BEGIN OF STATUS_Z3492_PRACTICE                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_PRACTICE                .
CONTROLS: TCTRL_Z3492_PRACTICE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z3492_PRACTICE                .
TABLES: Z3492_PRACTICE                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
