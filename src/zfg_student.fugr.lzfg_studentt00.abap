*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z4312_STUDENT...................................*
DATA:  BEGIN OF STATUS_Z4312_STUDENT                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z4312_STUDENT                 .
CONTROLS: TCTRL_Z4312_STUDENT
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZSTUDENTDETAILS.................................*
DATA:  BEGIN OF STATUS_ZSTUDENTDETAILS               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSTUDENTDETAILS               .
CONTROLS: TCTRL_ZSTUDENTDETAILS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z4312_STUDENT                 .
TABLES: *ZSTUDENTDETAILS               .
TABLES: Z4312_STUDENT                  .
TABLES: ZSTUDENTDETAILS                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
