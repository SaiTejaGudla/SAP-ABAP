*&---------------------------------------------------------------------*
*& Report Z1014304_ARTHIMETIC_CHECK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1014304_ARTHIMETIC_CHECK.

DATA: Add_Res TYPE String,
      Sub_Res TYPE string,
      Mul_Res TYPE String,
      Div_Res TYPE String,
      Mod_Res TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK Blk1 WITH FRAME TITLE Tit1.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 5(20) C1.
PARAMETERS p_num1 TYPE i OBLIGATORY.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 5(20) C2.
PARAMETERS p_num2 TYPE i OBLIGATORY.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK Blk1.

SELECTION-SCREEN BEGIN OF BLOCK Blk2 WITH FRAME TITLE Tit2.

PARAMETERS: P_Add AS CHECKBOX,
            P_Sub AS CHECKBOX,
            P_Mul AS CHECKBOX,
            P_Div AS CHECKBOX,
            P_Mod AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK Blk2.

INITIALIZATION.

Tit1 = 'Input Values'.
Tit2 = 'Operations'.
C1 = 'Enter Number'.
C2 = 'Enter Number'.

START-OF-SELECTION.

IF P_Add = 'X'.
  Add_Res = P_num1 + p_num2.
*  WRITE:/ Add_Res.
  MESSAGE Add_Res TYPE 'I'.
ENDIF.

IF P_Sub = 'X'.
  Sub_Res = P_num1 - p_num2.
*  WRITE:/ Add_Res.
  MESSAGE Sub_Res TYPE 'I'.
ENDIF.

IF P_Mul = 'X'.
  Mul_Res = P_num1 * p_num2.
*  WRITE:/ Add_Res.
  MESSAGE Mul_Res TYPE 'I'.
ENDIF.

IF P_Div = 'X'.
  Div_Res = P_num1 / p_num2.
*  WRITE:/ Add_Res.
  MESSAGE Div_Res TYPE 'I'.
ENDIF.

IF P_Mod = 'X'.
  Mod_Res = P_num1 + p_num2.
*  WRITE:/ Add_Res.
  MESSAGE Mod_Res TYPE 'I'.
ENDIF.

End-of-SELECTION.
