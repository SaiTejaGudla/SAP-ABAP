*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_H_EMP..................................*
DATA:  BEGIN OF STATUS_Z1013492_H_EMP                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_H_EMP                .
CONTROLS: TCTRL_Z1013492_H_EMP
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: Z3492_EMPDET....................................*
DATA:  BEGIN OF STATUS_Z3492_EMPDET                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z3492_EMPDET                  .
CONTROLS: TCTRL_Z3492_EMPDET
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z1013492_H_EMP                .
TABLES: *Z3492_EMPDET                  .
TABLES: Z1013492_H_EMP                 .
TABLES: Z3492_EMPDET                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
