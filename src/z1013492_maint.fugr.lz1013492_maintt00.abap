*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_MAINT..................................*
TABLES: Z1013492_MAINT, *Z1013492_MAINT. "view work areas
CONTROLS: TCTRL_Z1013492_MAINT
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_Z1013492_MAINT. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_Z1013492_MAINT.
* Table for entries selected to show on screen
DATA: BEGIN OF Z1013492_MAINT_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE Z1013492_MAINT.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF Z1013492_MAINT_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF Z1013492_MAINT_TOTAL OCCURS 0010.
INCLUDE STRUCTURE Z1013492_MAINT.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF Z1013492_MAINT_TOTAL.

*.........table declarations:.................................*
TABLES: Z1013492_TBILL                 .
TABLES: Z1013492_TOFFER                .
TABLES: Z1013492_TPAYMEN               .
TABLES: Z1013492_TUSER                 .
