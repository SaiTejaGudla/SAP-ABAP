*&---------------------------------------------------------------------*
*& Report Z1013492_STARTSELECTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_STARTSELECTION.

DATA: g_Final TYPE String,
      g_msg TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE A1.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 5(20) i1.
PARAMETERS p_num TYPE i OBLIGATORY.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 5(20) i2.
PARAMETERS p_num1 TYPE i OBLIGATORY.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK B1.

SELECTION-SCREEN BEGIN OF BLOCK B2 WITH FRAME TITLE A2.

PARAMETERS: P_Add RADIOBUTTON GROUP grp1 USER-COMMAND cmnd,
            P_Sub RADIOBUTTON GROUP grp1,
            P_Mul RADIOBUTTON GROUP grp1,
            P_Div RADIOBUTTON GROUP grp1,
            P_Mod RADIOBUTTON GROUP grp1 DEFAULT 'X'.

SELECTION-SCREEN END OF BLOCK  B2.

INITIALIZATION.
A1 = 'Input Values'.
A2 = 'Arthimetic Operation'.
i1 = 'Input 1'.
i2 = 'Input 2'.


AT SELECTION-SCREEN ON RADIOBUTTON GROUP grp1.

  CASE sy-ucomm.
    WHEN 'CMND'.
      IF P_Add = 'X'.
        g_Final = p_num + p_num.
        CONCATENATE text-001 g_Final INTO g_msg SEPARATED BY ' '.
        MESSAGE g_msg TYPE 'I'.
      ELSEIF P_Sub = 'X'.
        g_Final  = p_num - p_num1.
        CONCATENATE text-001 g_Final INTO g_msg SEPARATED BY ' '.
        MESSAGE g_msg TYPE 'I'.
     ELSEIF P_Mul = 'X'.
        g_Final = p_num * p_num1.
        CONCATENATE text-001 g_Final INTO g_msg SEPARATED BY ' '.
        MESSAGE g_msg TYPE 'I'.
     ELSEIF P_Div = 'X'.
        g_Final = p_num / p_num1.
        CONCATENATE text-001 g_Final INTO g_msg SEPARATED BY ' '.
        MESSAGE g_msg TYPE 'I'.
     ELSEIF P_Mod = 'X'.
        g_Final = p_num MOD p_num1.
        CONCATENATE text-001 g_Final INTO g_msg SEPARATED BY ' '.
        MESSAGE g_msg TYPE 'I'.
      ENDIF.

  ENDCASE.
