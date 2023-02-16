*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_EMP_DET................................*
DATA:  BEGIN OF STATUS_Z1013492_EMP_DET              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_EMP_DET              .
CONTROLS: TCTRL_Z1013492_EMP_DET
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: Z1013492_EMP_MAS................................*
DATA:  BEGIN OF STATUS_Z1013492_EMP_MAS              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_EMP_MAS              .
CONTROLS: TCTRL_Z1013492_EMP_MAS
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *Z1013492_EMP_DET              .
TABLES: *Z1013492_EMP_MAS              .
TABLES: Z1013492_EMP_DET               .
TABLES: Z1013492_EMP_MAS               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
