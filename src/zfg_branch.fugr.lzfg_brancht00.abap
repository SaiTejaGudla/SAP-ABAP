*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZBRANCHDETAILS..................................*
DATA:  BEGIN OF STATUS_ZBRANCHDETAILS                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZBRANCHDETAILS                .
CONTROLS: TCTRL_ZBRANCHDETAILS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZBRANCHDETAILS                .
TABLES: ZBRANCHDETAILS                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
