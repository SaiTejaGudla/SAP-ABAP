*&---------------------------------------------------------------------*
*& Include          Z1013492_AMAZON_MAIN
*&---------------------------------------------------------------------*

SELECT *
  FROM z1013492_tuser
  INTO TABLE it_amazon.

wa_fcat-fieldname = 'USER_ID'.
wa_fcat-col_pos   = 1.
wa_fcat-seltext_m = 'User ID'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'MAIL_ID'.
wa_fcat-col_pos   = 5.
wa_fcat-seltext_m = 'Mail ID'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'F_NAME'.
wa_fcat-col_pos   = 2.
wa_fcat-seltext_m = 'First Name'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'M_NAME'.
wa_fcat-col_pos   = 3.
wa_fcat-seltext_m = 'Middle Name'.
wa_fcat-edit      = 'X'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'L_NAME'.
wa_fcat-col_pos   = 4.
wa_fcat-seltext_m = 'Last Name'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'DOB'.
wa_fcat-col_pos   = 6.
wa_fcat-seltext_m = 'Date of Birth'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'CONTACT'.
wa_fcat-col_pos   = 7.
wa_fcat-seltext_m = 'Phone_No'.
wa_fcat-edit      = 'X'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

wa_fcat-fieldname = 'ADDRESS_ID'.
wa_fcat-col_pos   = 8.
wa_fcat-seltext_m = 'Address No'.
APPEND wa_fcat to it_fcat.
CLEAR wa_fcat.

gs_layout-colwidth_optimize = 'X'.
gs_layout-zebra             = 'X'.
