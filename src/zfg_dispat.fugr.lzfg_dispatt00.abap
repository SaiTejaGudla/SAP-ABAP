*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_TDISPAT................................*
DATA:  BEGIN OF STATUS_Z1013492_TDISPAT              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TDISPAT              .
CONTROLS: TCTRL_Z1013492_TDISPAT
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_TDISPAT              .
TABLES: Z1013492_TDISPAT               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
