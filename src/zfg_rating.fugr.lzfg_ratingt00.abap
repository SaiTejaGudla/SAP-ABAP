*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z3492_RATINGTAB.................................*
DATA:  BEGIN OF STATUS_Z3492_RATINGTAB               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_RATINGTAB               .
CONTROLS: TCTRL_Z3492_RATINGTAB
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z3492_RATINGTAB               .
TABLES: Z3492_RATINGTAB                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
