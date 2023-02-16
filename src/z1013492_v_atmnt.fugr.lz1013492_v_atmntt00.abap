*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: Z1013492_V_ATMNT................................*
TABLES: Z1013492_V_ATMNT, *Z1013492_V_ATMNT. "view work areas
CONTROLS: TCTRL_Z1013492_V_ATMNT
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_Z1013492_V_ATMNT. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_Z1013492_V_ATMNT.
* Table for entries selected to show on screen
DATA: BEGIN OF Z1013492_V_ATMNT_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE Z1013492_V_ATMNT.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF Z1013492_V_ATMNT_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF Z1013492_V_ATMNT_TOTAL OCCURS 0010.
INCLUDE STRUCTURE Z1013492_V_ATMNT.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF Z1013492_V_ATMNT_TOTAL.

*.........table declarations:.................................*
TABLES: Z1013492_TACCDE                .
TABLES: Z1013492_T_TRANS               .
