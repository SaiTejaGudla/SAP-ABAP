*&---------------------------------------------------------------------*
*& Report Z1013492_DEMO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_DEMO.
*input
**various ways to give inputs
*PARAMETERS p_para type c.
*write P_para.
*
*PARAMETERS: p_par type i,
*            numbr(10) type c.
*PARAMETERS par1 type char10.
*write:/ p_par,
*      /  numbr.
*
*Data name type c.
*name = 'vari'.
*write:/ name.
*
*data: name1 type c value '1',
*      name2(2) type n.
*
*name2 = '23'.
*
*write:/ name1,
*      / name2.


*Declarations
*variable declarations
*data var type c.
*
*data var1 type var.
*
*data var2 like var.
*
*data var3 like mara-matnr.
*
*data var4 like mara.
*
*CONSTANTS var5 type string VALUE 'something!'.
*
*CONSTANTS VAR10 LIKE VAR5 VALUE 'SOME'.
*
*data var6 type zstr-address.
*
*types var7 type mtart.
*
*data: matr type c,
*      mar type c,
*      mnt type n.
*
*types: mar1 type n,
*       mar2 type i.


*Work area Declarations

*types: BEGIN OF ty_str,
*        var1 type string,
*        var2 type c,
*       END OF ty_str.
*data group1 type ty_str.
*
*data grp2 like group1.
*
*data grp3 type group1.
*
*data grp4 type mara.
*
*types: BEGIN OF str.
*      INCLUDE STRUCTURE zstr.
*TYPES: END OF str.
*data wa type str.

*data wa1 like line of mara.

*data: BEGIN OF str1,
*      g1 type c,
*      g2 type n,
*      g3 type i,
*     End of str1.


*Internal Table Declarations

* With Headerline

*DATA: BEGIN OF tab_ekpo occurs 0,
*      vary type ekpo,
*      vary1 type ebelp,
*      vary3 type matnr,
*     END OF tab_ekpo.

*Wihtout Headerline.
* TYPES: BEGIN OF tab1,
*        address type zstr,
*        variable2 type ZSTR_1013492_ADDINFO-Z1013492_AADHar,
*        END OF tab1.
*data it_tab1 TYPE TABLE OF tab1.
*
*data wa_tab type TABLE OF tab1.
*
*data wa_tab1 type tab1."Work Area
*
*data tab2 TYPE TABLE OF mara.
*
*data tab3 like line of mara."Work Area

* data type table of zstr."Through structure.

*Select Options

*data range type mara-matnr.
*SELECT-OPTIONS s_range1 for range.
*LOOP AT s_range1.
*  WRITE:/ s_range1-low,
*          S_range1-high.
*ENDLOOP.


*TYPES: BEGIN OF ty_mara,
*       mat type matnr,
*       END OF ty_mara.
*
*data: it_tab TYPE TABLE of ty_mara,
*      wa_tab type ty_mara.
*
*data range type mara-matnr.
*SELECT-OPTIONS s_range1 for range.
*
*SELECT matnr from mara into table it_tab
*  where matnr in s_range1.
*LOOP AT it_tab INTO wa_tab.
*  WRITE: / wa_tab-mat.
*ENDLOOP.

DATA lv type mara.
*
*SELECT SINGLE matnr from mara INTO lv WHERE matnr = '222111A'.
*
*write:/ lv-matnr.
*       40 lv-mtart,
*       60 lv-mbrsh.

SELECT matnr FROM mara INTO lv UP TO 10 rows." WHERE matnr = '222111A'.
  write:/ lv-matnr,
       40 lv-mtart,
       60 lv-mbrsh.
ENDSELECT.



*data lv type mara.
*SELECT * from mara into lv.
* WRITE:/ lv-matnr,
*       50 lv-mtart,
*       80 lv-mbrsh.
* ENDSELECT.

*DATA: lv_mara type mara.
*
*select single * from mara INTO lv_mara where ernam  = 'GENERIC-01'.
*
*
*WRITE:/ lv_mara-matnr,
*        lv_mara-mtart,
*        lv_mara-mbrsh,
*        lv_mara-ernam.

*
* types: BEGIN OF ty_mar,
*        aadhar(30) type c,
*        empid(30) type c,
*        branch(20) type c,
*        clgid(40) type c,
*        quota(10) type c,
*        END OF ty_mar.
*data it_cust type table of ty_mar.
*data wa_cust type ty_mar.
*SELECT a~aadhar
*       a~emp_id
*       b~branch
*       c~clg_id
*       c~quota
*from z3492_example1 as a INNER JOIN z3492_example2 as b on a~aadhar = b~aadhar
* INNER JOIN z3492_example3 as c on b~clg_id = c~clg_id into TABLE it_cust.
*
*LOOP AT it_cust into wa_cust.
*  write:/ wa_cust-aadhar,
*        20 wa_cust-empid,
*        40 wa_cust-branch,
*        60 wa_cust-clgid,
*        80 wa_cust-quota.
*ENDLOOP.

*types: BEGIN OF ty_mar,
*        aadhar(16) type c,
*        empid(8) type c,
*        branch(20) type c,
*        clgid(10) type c,
*        quota(20) type c,
*        END OF ty_mar.
*data: it_cust type table of ty_mar,
*      wa_cust type ty_mar.
*select a~aadhar
*        a~emp_id
*        b~branch
*        b~clg_id
*        c~quota
*  from z3492_example1 as a INNER JOIN z3492_example2 as b ON a~aadhar = b~aadhar
*  LEFT OUTER JOIN z3492_example3 as c on b~clg_id = c~clg_id
*   INTO table it_cust.
*LOOP AT it_cust into wa_cust.
*  write:/ wa_cust-aadhar,
*        20 wa_cust-empid,
*        40 wa_cust-branch,
*        60 wa_cust-clgid,
*        80 wa_cust-quota.
*ENDLOOP.


*types: BEGIN OF ty_mar,
*        aadhar(30) type c,
*        empid(30) type c,
*        END OF ty_mar.
*
*data: it_tab type table of ty_mar,
*      wa_tab type ty_mar.
*
*SELECT aadhar from z3492_example1 into table it_tab.
*
*LOOP AT it_tab into wa_tab.
*  write:/ wa_tab-aadhar,
*          wa_tab-empid.
*ENDLOOP.


*data: tab1 type table of mara,
*      tab2 type TABLE OF makt.
*
*SELECT * from mara into TABLE tab1 where mtart  = 'FERT'.
*IF tab1 is not INITIAL.
*
*  sort tab1 by matnr.
*
*  SELECT * from makt
*   INTO TABLE tab2
*    FOR ALL ENTRIES IN tab1
*    WHERE matnr = tab1-matnr.
*
*
*ENDIF.



*data: init1 type string,
*      init2 type string value 'hfdgslja'.
*
*IF init1 is INITIAL.
*  WRITE ' it is empty'.
*  elseif init2 is INITIAL.
*    write ' init2 is empty'.
*   else.
*     write ' both are empty'.
*
*ENDIF.

*PARAMETERS: exmp(10) type c,
*            len type i.
*len = strlen( exmp ).
*CASE len.
*  WHEN 5.
*    WRITE '5'.
*  WHEN 6.
*    WRITE '6'.
*  WHEN OTHERS.
*    write'OTHERS'.
*ENDCASE.

*PARAMETERS even type i.
*DO 10 TIMES.
*  write even.
*  even = even + 1.
*ENDDO.

*PARAMETERS odd type i.
*data init type i VALUE 1.
*WHILE init <= 30.
*  write odd.
*  odd = odd + 1.
* init = init + 1.
*ENDWHILE.


*Arithmetic operators
* +,-, /,*

*data : a type i VALUE 5,
*       b type i value 6,
*       c type i.
*
*c = a + b.
*write c.


*Comparison Operators
*EQ, NE, GE, LE, GT, LT
*
*data : a type i VALUE 5,
*       b type i value 6.
*
*IF a <> b.
*  WRITE ' true'.
*  else.
*    WRITE ' false'.
*ENDIF.

*INITIAL / NOT INITIAL (Comparison Operator)

*PARAMETERS a type i.
*
*IF a is NOT INITIAL.
*  write ' contains value'.
*  else.
*    WRITE ' does not contains value'.
*
*ENDIF.

*Character String Operators.
* CO(Contains Only) CN(not contains only) CS(contains string) NS(Not contains string) CA(contains any) NA(not contains any)
*CP(contains pattern) NP(not contains pattern)
*
*PARAMETERS: A(13) TYPE C,
*            B(13) TYPE C.
*IF a co b.
*  write ' contains char of b'.
*  else.
*    write ' not contains char'.

*ENDIF.


*PARAMETERS: A(10) TYPE c,
*            B(10) TYPE c.
*IF a cn b.
*  write 'not contains'.
*  else.
*    write ' string contains'.
*
*ENDIF.

*PARAMETERS: A(10) TYPE c,
*            B(10) TYPE c.
*IF a cs b.
*  write 'string contains'.
*  else.
*    write ' not contains'.
*
*ENDIF.

*PARAMETERS: A(10) TYPE c,
*            B(10) TYPE c.
*IF a cp b.
*  write 'string contains'.
*  else.
*    write ' not contains'.
*
*ENDIF.



*Iteartion Techniques

*loop
* data:it_tab type table of mara,
*       wa_tab type mara.
*
* select * from mara into table it_tab.
*
*   LOOP AT it_tab into wa_tab where mtart = 'ROH'.
*     write:/ wa_tab-matnr,
*            wa_tab-mtart.
*
*   ENDLOOP.


*  read

*   data:it_tab type table of mara,
*       wa_tab type mara.
*
* select * from mara into table it_tab.
*
*   read TABLE it_tab into wa_tab WITH KEY mtart = 'ROH'.
*     write:/ wa_tab-matnr,
*            wa_tab-mtart.

*String operations

*CONCATENATE

*DATA: var1 type string VALUE 'Hello',
*      var2 type string VALUE 'ABAP',
*      var3 type string VALUE 'World',
*      output type string,
*      output1 type string.
*
*CONCATENATE var1 var2 var3 INTO output.
*
*WRITE output.
*
*CONCATENATE var1 var2 var3 INTO output1 SEPARATED BY '-'.
*
*WRITE / output1.

*replace

*DATA:val TYPE string VALUE 'WORLD',
*     str type string VALUE 'SAP ABAP DEVELOPMENT'.
**
*WRITE:/ str.
*
*REPLACE 'DEVELOPMENT' WITH lv_val INTO lv_str.
*
*WRITE:/ str.

*PARAMETERS: input type string.
*data: var1 type c value 'T',
*      var2 type c value 'v'.
*
*REPLACE ALL OCCURRENCES OF 'T' in input with 'V'.
*write input.

*split

*DATA: var1(10) type C,
*      var2(10) type C,
*      var3(10) type C,
*      value(20) type C VALUE 'abc-def-ghi'.
*
*
*SPLIT value at '-' INTO var1 var2 var3.
*
*
*
*WRITE:/ 'value - ', value.
*WRITE:/ 'var1 - ', var1.
*WRITE:/ 'var2 - ', var2.
*WRITE:/ 'var3 - ', var3.

*Condense

*DATA: title(30) type C VALUE '     SAP ABAP Tutorial'.
*
*WRITE:/ title.
*
*CONDENSE title.
*
*WRITE:/ title.
*
*CONDENSE title NO-GAPS.
*
*WRITE:/ title.

*SEARCH

*PARAMETERS: p_val TYPE string,
*           p_str type string.
*
*SEARCH p_str for p_val.
*
*IF sy-subrc = 0.
*WRITE 'Found'.
*else.
*WRITE 'Not Found'.
*ENDIF.

*Offset
*DATA: date type dats VALUE '20220221'.   " YYYYMMDD
*
*WRITE:/ 'Year', date+0(4).
*
*WRITE:/ 'Month', date+4(2).
*
*WRITE:/ 'Date', date+6(2).

*shift

*DATA: lv_name(10) type C VALUE '100000'.
*
*
*WRITE:/ lv_name.
*
*SHIFT lv_name RIGHT DELETING TRAILING'0'.
*
*
*WRITE:/ lv_name.


** STRING LENGTH

*DATA: str TYPE string VALUE '12345678',
*      lv_val type N.
*
*     lv_val = strlen( str ).
*
*    WRITE lv_val.



*DATA ty type mara-matnr.
*SELECT-OPTIONS lv_type for ty."(mara-matnr).
*
*LOOP AT ty INTO lv_type.
*
*write: lv_type.


*types: BEGIN OF ty_mar,
*        aadhar(16) type c,
*        empid(8) type c,
*        branch(20) type c,
*        clgid(10) type c,
*        quota(20) type c,
*        END OF ty_mar.
*data: it_cust type table of ty_mar,
*      wa_cust type ty_mar.
*select a~aadhar
*        a~emp_id
*        b~branch
*        b~clg_id
*        c~quota
*  from z3492_example1 as a CROSS JOIN z3492_example2 as b. "ON a~aadhar = b~aadhar
**  LEFT OUTER JOIN z3492_example3 as c on b~clg_id = c~clg_id
*   INTO table it_cust.
*LOOP AT it_cust into wa_cust.
*  write:/ wa_cust-aadhar,
*        20 wa_cust-empid,
*        40 wa_cust-branch,
*        60 wa_cust-clgid,
*        80 wa_cust-quota.
*ENDLOOP.

*
*PARAMETERS num type i.
*WRITE num.
*
*DATA : g_data type char2.
* g_data = 12.
* WRITE g_data.


*PARAMETERS g_data type c." OBLIGATORY.
*write: g_data.
