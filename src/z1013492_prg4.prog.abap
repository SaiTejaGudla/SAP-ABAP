*&---------------------------------------------------------------------*
*& Report Z1013492_PRG4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_prg4.
*PARAMETERS p_name TYPE c.
*WRITE p_name.
*types dat type c.
*DATA dat(5).
*dat = 'se'.
*WRITE dat.
*data gend type Z3492_PRACTICE.
*gend = 'fhg'.
*write gend.
*data var1 type c.
*var1 = '3'.
*write var1.
*data it_name type table of z3492_practice.
*it_name1 = it_name.
*move it_name to it_name1.

*PARAMETERS: name(10) type c,
*            naem type i.
*data name1 type i.
*name1 = '234'.
*write:/ name,
*       / naem.
*WRITE:/ name1.



*DATA: names(10) TYPE c,
*      used(10)  TYPE c.
*names = 'strings'.
*used = '812876'.
*WRITE names.
*WRITE:/ used.
*
*DATA lv_name(10) TYPE c.
*lv_name = 'character'.
*WRITE lv_name.
*
**PARAMETERS lv_var type i.
**WRITE lv_var.
*
*TYPES var5 LIKE names.
*DATA var5(10).
*var5 = 'agfsgare'.
*WRITE var5.
*
*DATA name TYPE z_dhavan.
*
*DATA name2 TYPE z3492_practice-dhavan.
*
*CONSTANTS permanent(20) TYPE c VALUE 'hi'.
*WRITE permanent.
*
*TYPES matr TYPE z3492_practice-dhavan.
*
**Work Area
*TYPES: BEGIN OF ty_work.
*         INCLUDE STRUCTURE zstr.
*TYPES: END OF ty_work.
*
*DATA wa TYPE ty_work.
*DATA wa1 LIKE wa.
*DATA wa2 TYPE z3492_practice.
*
*DATA : BEGIN OF str1,
*         group1     TYPE string,
*         group2(10) TYPE c,
*         group3(10) TYPE n,
*       END OF str1.
*
*TYPES : BEGIN OF create,
*          down1 TYPE c,
*          down2 TYPE i,
*          down3 TYPE n,
*        END OF create.
*
*DATA wa_create TYPE create.
*
*
*data : variable type c,
*      var2 like variable.
*
*CONSTANTS con1(2) type c VALUE '23'.
*CONSTANTS con2 like con1 value '45'.
**tables: mara.
*DATA mnt type mara-matnr.
*SELECT-OPTIONS s_mnt for mnt.

*data: it_tab type table of y1013492_dheader,
*      wa_tab type y1013492_dheader.
*
*SELECT * from y1013492_dheader into TABLE it_tab.
*
*LOOP AT it_tab into wa_tab FROM 1 to 10.
*  write:/5 wa_tab.
*
*ENDLOOP.
types: BEGIN OF ty_str,
         str1 TYPE mara-matnr,
         str2 TYPE mara-mtart,
         str3 TYPE mara-mbrsh,
       END OF ty_str.
*
*data: str4 TYPE TABLE OF ty_str,
*      wa_mara TYPE ty_str.
*
*SELECT matnr mtart mbrsh FROM mara INTO TABLE str4.
*
*LOOP AT str4 INTO wa_mara.
*  WRITE:/1 wa_mara-str1,
*  30 wa_mara-str2,
*  60 wa_mara-str3.
*
*ENDLOOP.
*
data: it_tab type table of mara,
      wa_tab type mara.
SELECT * from mara into TABLE it_tab.
if sy-subrc = 0.
*LOOP AT it_tab INTO wa_tab WHERE mtart = 'ROH'.
*write:/1 wa_tab-mtart,
*       30 wa_tab-matnr,
*       50 wa_tab-mbrsh.
*ENDLOOP.

  READ TABLE it_tab INTO wa_tab INDEX 9.
  write:/ wa_tab-matnr.
endif.



*DATA tab type z3492_example1-aadhar.
*DATA lv_matnr type mara-matnr.
*SELECT-OPTIONS s_mnt for tab.
*SELECT-OPTIONS s_mnt1 for lv_matnr.
