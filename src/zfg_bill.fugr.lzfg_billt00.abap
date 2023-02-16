*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_H_BILL.................................*
DATA:  BEGIN OF STATUS_Z1013492_H_BILL               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_H_BILL               .
CONTROLS: TCTRL_Z1013492_H_BILL
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: Z1013492_O_BILL.................................*
DATA:  BEGIN OF STATUS_Z1013492_O_BILL               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_O_BILL               .
CONTROLS: TCTRL_Z1013492_O_BILL
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: Z1013492_TBILL..................................*
DATA:  BEGIN OF STATUS_Z1013492_TBILL                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_TBILL                .
CONTROLS: TCTRL_Z1013492_TBILL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_H_BILL               .
TABLES: *Z1013492_O_BILL               .
TABLES: *Z1013492_TBILL                .
TABLES: Z1013492_H_BILL                .
TABLES: Z1013492_O_BILL                .
TABLES: Z1013492_TBILL                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
