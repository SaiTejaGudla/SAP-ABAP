*&---------------------------------------------------------------------*
*& Report Z1013492_TAB_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_TAB_SCREEN.

SELECTION-SCREEN BEGIN OF TABBED BLOCK TB1 FOR 5 LINES.
SELECTION-SCREEN TAB (79) Tab1 USER-COMMAND uc1.
SELECTION-SCREEN TAB (79) Tab2 USER-COMMAND uc2.
SELECTION-SCREEN  END OF BLOCK TB1.

SELECTION-SCREEN BEGIN OF SCREEN 150 as SUBSCREEN.
SELECTION-SCREEN COMMENT 5(30) com1.
PARAMETERS: p_num1 TYPE i OBLIGATORY,
            p_num2 TYPE i OBLIGATORY,
            p_Add RADIOBUTTON GROUP rad1 DEFAULT 'X',
            p_Sub RADIOBUTTON GROUP rad1.
SELECTION-SCREEN END OF SCREEN 150.

SELECTION-SCREEN BEGIN OF SCREEN 200 as SUBSCREEN.
SELECTION-SCREEN COMMENT 5(30) com2.
PARAMETERS: p_numb1 TYPE i OBLIGATORY,
            p_numb2 TYPE i OBLIGATORY,
            p_Mul RADIOBUTTON GROUP rad2,
            p_Div RADIOBUTTON GROUP rad2,
            p_Mod RADIOBUTTON GROUP rad2.
SELECTION-SCREEN END OF SCREEN 200.

INITIALIZATION.
TB1-activetab = 'uc1'.
tb1-dynnr = '150'.
Tb1-prog = sy-repid.

Tab1 = 'TAB1'.
Tab2 = 'TAB2'.
com1 = 'Addition-Difference'.
com2 =  'Mul-Div-Mod'.

AT SELECTION-SCREEN.

CASE sy-ucomm.
  WHEN 'UC1'.
    TB1-activetab = 'uc1'.
    tb1-dynnr = '150'.
    Tb1-prog = sy-repid.
  WHEN'UC2'.
     TB1-activetab = 'uc2'.
     tb1-dynnr = '200'.
     Tb1-prog = sy-repid.
  WHEN OTHERS.
ENDCASE.
