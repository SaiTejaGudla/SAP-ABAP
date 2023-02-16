*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_H_HOTEL................................*
DATA:  BEGIN OF STATUS_Z1013492_H_HOTEL              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_H_HOTEL              .
CONTROLS: TCTRL_Z1013492_H_HOTEL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_H_HOTEL              .
TABLES: Z1013492_H_HOTEL               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
