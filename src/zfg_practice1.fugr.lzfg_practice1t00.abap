*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z3492_PRACTICE1.................................*
DATA:  BEGIN OF STATUS_Z3492_PRACTICE1               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_PRACTICE1               .
CONTROLS: TCTRL_Z3492_PRACTICE1
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z3492_PRACTICE1               .
TABLES: Z3492_PRACTICE1                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
