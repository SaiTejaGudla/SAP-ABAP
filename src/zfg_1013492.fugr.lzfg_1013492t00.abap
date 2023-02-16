*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_SCHOOL.................................*
DATA:  BEGIN OF STATUS_Z1013492_SCHOOL               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_SCHOOL               .
CONTROLS: TCTRL_Z1013492_SCHOOL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_SCHOOL               .
TABLES: Z1013492_SCHOOL                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
