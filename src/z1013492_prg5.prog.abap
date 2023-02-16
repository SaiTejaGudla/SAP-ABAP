*&---------------------------------------------------------------------*
*& Report Z1013492_PRG5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_prg5.

*TYPES: BEGIN OF merge,
*         aadhar TYPE z_aadhar,
*         empid  TYPE z_empi_id,
*         clgid  TYPE z_clg_id,
*         rank   TYPE z_rank,
*         join   TYPE z_join_date,
*       END OF merge.
*DATA: internal TYPE TABLE OF merge,
*      work     TYPE merge.
*
*SELECT office~aadhar
*       office~emp_id
*       clg~clg_id
*       clg~rank
*       office~join_date
*  INTO TABLE internal FROM z3492_example1 AS office LEFT OUTER JOIN z3492_example2 AS clg
*  ON office~aadhar = clg~aadhar.
*
*LOOP AT internal INTO work.
*  WRITE:/1 work-aadhar,
*         20 work-empid,
*         40 work-clgid,
*         60 work-rank,
*         80 work-join.
*ENDLOOP.
*tables: z3492_example1.
*data ex type z3492_example1-aadhar.
*SELECT-OPTIONS s_mar for ex.
*
*data


*PARAMETERS: p(10) type c,
*            q(10) type c.
*if p cs q.
*  write ' p has q'.
* Else.
*  write ' p does not have q'.
*ENDIF.

data inti type i value '10'.
DO 10 TIMES.
write:/ inti.
inti = inti + 1.
ENDDO.
