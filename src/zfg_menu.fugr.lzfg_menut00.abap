*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_H_MENU.................................*
DATA:  BEGIN OF STATUS_Z1013492_H_MENU               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_H_MENU               .
CONTROLS: TCTRL_Z1013492_H_MENU
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_H_MENU               .
TABLES: Z1013492_H_MENU                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
