*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_H_CUST.................................*
DATA:  BEGIN OF STATUS_Z1013492_H_CUST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_H_CUST               .
CONTROLS: TCTRL_Z1013492_H_CUST
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: Z1013492_T_CUST.................................*
DATA:  BEGIN OF STATUS_Z1013492_T_CUST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_T_CUST               .
CONTROLS: TCTRL_Z1013492_T_CUST
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_H_CUST               .
TABLES: *Z1013492_T_CUST               .
TABLES: Z1013492_H_CUST                .
TABLES: Z1013492_T_CUST                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
