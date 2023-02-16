*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TINVENT................................*
DATA:  BEGIN OF STATUS_Z1013492_TINVENT              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TINVENT              .
CONTROLS: TCTRL_Z1013492_TINVENT
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TINVENT              .
TABLES: Z1013492_TINVENT               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
