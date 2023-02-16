*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_ASSIGNMENT_12.

DATA:
"Memory to hold the Variable
       gv_value1    type I value 10,
       gv_value2    type I value 5,
       gv_res1      type I,
       gv_res2      type I,
       gv_final_res type I.

gv_res1 = gv_value2 mod gv_value1.
gv_res2 = gv_value1 div gv_value2.

gv_final_res = gv_res1 + gv_res2.
write: gv_final_res.
