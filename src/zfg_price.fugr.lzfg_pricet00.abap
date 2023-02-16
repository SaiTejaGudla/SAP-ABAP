*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z3492_PRICETAB..................................*
DATA:  BEGIN OF STATUS_Z3492_PRICETAB                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_PRICETAB                .
CONTROLS: TCTRL_Z3492_PRICETAB
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z3492_PRICETAB                .
TABLES: Z3492_PRICETAB                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
