*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_H_ADRES................................*
DATA:  BEGIN OF STATUS_Z1013492_H_ADRES              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_H_ADRES              .
CONTROLS: TCTRL_Z1013492_H_ADRES
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: Z1013492_O_ADRES................................*
DATA:  BEGIN OF STATUS_Z1013492_O_ADRES              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z1013492_O_ADRES              .
CONTROLS: TCTRL_Z1013492_O_ADRES
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *Z1013492_H_ADRES              .
TABLES: *Z1013492_O_ADRES              .
TABLES: Z1013492_H_ADRES               .
TABLES: Z1013492_O_ADRES               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
