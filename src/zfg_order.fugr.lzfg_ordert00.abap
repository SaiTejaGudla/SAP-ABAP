*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_H_ORDER................................*
DATA:  BEGIN OF STATUS_Z1013492_H_ORDER              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_H_ORDER              .
CONTROLS: TCTRL_Z1013492_H_ORDER
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: Z1013492_TORDER.................................*
DATA:  BEGIN OF STATUS_Z1013492_TORDER               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TORDER               .
CONTROLS: TCTRL_Z1013492_TORDER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_H_ORDER              .
TABLES: *Z1013492_TORDER               .
TABLES: Z1013492_H_ORDER               .
TABLES: Z1013492_TORDER                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
