*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_H_STOCK................................*
DATA:  BEGIN OF STATUS_Z1013492_H_STOCK              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_H_STOCK              .
CONTROLS: TCTRL_Z1013492_H_STOCK
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_H_STOCK              .
TABLES: Z1013492_H_STOCK               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
