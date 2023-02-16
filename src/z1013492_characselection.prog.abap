*&---------------------------------------------------------------------*
*& Report Z1013492_CHARACSELECTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_CHARACSELECTION.

DATA: g_final TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE A1.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 5(20) i1.
PARAMETERS p_num TYPE string OBLIGATORY.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 5(20) i2.
PARAMETERS p_num1 TYPE string OBLIGATORY.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK B1.

SELECTION-SCREEN BEGIN OF BLOCK B2 WITH FRAME TITLE A2.

PARAMETERS: P_CO RADIOBUTTON GROUP grp1 USER-COMMAND cmnd,
            P_CN RADIOBUTTON GROUP grp1,
            P_CS RADIOBUTTON GROUP grp1,
            P_NS RADIOBUTTON GROUP grp1,
            P_CP RADIOBUTTON GROUP grp1,
            P_NP RADIOBUTTON GROUP grp1,
            P_CA RADIOBUTTON GROUP grp1,
            P_NA RADIOBUTTON GROUP grp1 DEFAULT 'X'.

SELECTION-SCREEN END OF BLOCK  B2.

INITIALIZATION.
A1 = 'Input Values'.
A2 = 'Arthimetic Operation'.
i1 = 'Input 1'.
i2 = 'Input 2'.


AT SELECTION-SCREEN ON RADIOBUTTON GROUP grp1.

  CASE sy-ucomm.
    WHEN 'CMND'.
      IF P_co = 'X'.
        IF p_num co p_num1.
          g_final = 'Contains Only'.
          write:/ g_final.
          ELSEIF p_num cn p_num1.
           g_final = 'Not contains'.
           WRITE:/ g_final.
         ENDIF.
         MESSAGE g_final TYPE 'I'.
      ELSEIF p_cs = 'X'.
        IF p_num cs p_num1.
          g_final = 'Contains String'.
          write:/ g_final.
          ELSEIF p_num ns p_num1.
           g_final = 'Not Contains String'.
           WRITE:/ g_final.
        ENDIF.
        MESSAGE g_final TYPE 'I'.
      ELSEIF p_ca = 'X'.
        IF p_num ca p_num1.
          g_final = 'Contains Any'.
          write:/ g_final.
          ELSEIF p_num na p_num1.
           g_final = 'Not Contains Any'.
           WRITE:/ g_final.
        ENDIF.
        MESSAGE g_final TYPE 'I'.
       ELSEIF p_cp = 'X'.
        IF p_num cp p_num1.
          g_final = 'Contains Pattern'.
          write:/ g_final.
          ELSEIF p_num np p_num1.
           g_final = 'Not Contains Pattern'.
           WRITE:/ g_final.
        ENDIF.
        MESSAGE g_final TYPE 'I'.
      ENDIF.
  ENDCASE.
