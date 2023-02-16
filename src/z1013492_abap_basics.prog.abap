*&---------------------------------------------------------------------*
*& Report Z1013492_ABAP_BASICS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_abap_basics.
"Question-1..

PARAMETERS: p_data TYPE string.
TYPES: BEGIN OF ty_str,
         lifnr TYPE lifnr,
         ebeln TYPE ebeln,
         lponr TYPE lponr,
       END OF ty_str.

DATA: it_tab TYPE TABLE OF ty_str,
      wa_tab TYPE ty_str.

TYPES: BEGIN OF ty_str1,
         kunnr     TYPE kunnr,
         name1(35) TYPE c,
         bsark     TYPE bsark,
       END OF ty_str1.

DATA: it_tab1 TYPE TABLE OF ty_str1,
      wa_tab1 TYPE ty_str1.

SELECT lf~lifnr
       ek~ebeln
       ek~lponr
FROM lfa1 AS lf INNER JOIN ekko AS ek ON lf~lifnr = ek~lifnr INTO TABLE it_tab. "WHERE lf~lifnr = p_data.

SELECT kn~kunnr
       kn~name1
       vk~bsark
  FROM kna1 AS kn
 INNER JOIN vbak AS vk
    ON kn~kunnr = vk~kunnr
  INTO TABLE it_tab1.

IF sy-subrc = 0.
  LOOP AT it_tab INTO wa_tab.
    IF p_data = wa_tab-lifnr.
        WRITE:/ wa_tab-lifnr,
                wa_tab-ebeln,
                wa_tab-lponr.
    ENDIF.
  ENDLOOP.

  LOOP AT it_tab1 INTO wa_tab1.
    IF p_data = wa_tab1-kunnr.

      WRITE:/ wa_tab1-kunnr,
              wa_tab1-name1,
              wa_tab1-bsark.
    ENDIF.
  ENDLOOP.
ELSE.
  MESSAGE TEXT-001 TYPE 'E'.
ENDIF.



" Question-2..

*TYPES: BEGIN OF ty_car,
*       Brand TYPE string,
*       Top1 TYPE string,
*       Top2 type string,
*       Top3 TYPE string,
*      END OF ty_car.
*
* DATA: it_car TYPE TABLE of ty_car,
*       wa_car TYPE ty_car.
*
*wa_car-Brand = 'Maruthi'.
*wa_car-Top1 = 'Alto'.
*wa_car-Top2 = 'Swift'.
*wa_car-Top3 = 'Dzire'.
*
*APPEND wa_car to it_car.
*
*wa_car-Brand = 'Hyundai'.
*wa_car-Top1 = 'Eon'.
*wa_car-Top2 = 'Grand i10'.
*wa_car-Top3 = 'i20'.
*APPEND wa_car to it_car.
*
*wa_car-Brand = 'Toyota'.
*wa_car-Top1 = 'Fortuner'.
*wa_car-Top2 = 'Innova'.
*wa_car-Top3 = 'Glanza'.
*APPEND wa_car to it_car.
*
*write sy-uline+0(46).
*
*write:/1 sy-vline,
*       3 'Brand', 16 sy-vline,
*       18 'Top1', 26 sy-vline,
*       28 'Top2', 36 sy-vline,
*       38 'Top3', 46 sy-vline.
*
*write:/ sy-uline+0(46).
*
*LOOP AT it_car INTO wa_car.
*write:/1 sy-vline,
*       3 wa_car-Brand, 16 sy-vline,
*       18 wa_car-Top1, 26 sy-vline,
*       27 wa_car-Top2, 36 sy-vline,
*       38 wa_car-TOp3, 46 sy-vline.
*write:/ sy-uline+0(46).
*
*ENDLOOP.

"Question-4....
*
*PARAMETERS: p_I1      TYPE i,
*            p_I2      TYPE i,
*            P_Arth(3) TYPE c,
*            P_final   TYPE i.
*DATA : Result TYPE i.
*
*IF p_arth = 'ADD'.
*  Result = p_I1 + p_I2.
*ELSEIF p_arth = 'SUB'.
*  Result = p_I1 - p_I2.
*ELSEIF p_arth = 'MUL'.
*  Result = p_I1 * p_I2.
*ELSEIF p_arth = 'DIV'.
*  Result = p_I1 / p_I2.
*ELSEIF p_arth = 'MOD'.
*  Result = p_I1 MOD p_I2.
*ELSE.
*  EXIT.
*ENDIF.
*
*IF p_final eq Result.
*  WRITE 'True'.
*ELSE.
*  WRITE 'False'.
*ENDIF.


"Question-5.....

*TYPES:
** Structure to hold the customer details
*  BEGIN OF ty_cust,
*    kunnr TYPE kunnr,
*    bstnk TYPE bstnk,
*    kdmat TYPE matnr_ku,
*  END   OF ty_cust.
*
*DATA:
** Internal table to hold the cutomer details
*  it_cust TYPE TABLE OF ty_cust,
** Workarea to hold the customer details
*  wa_cust TYPE ty_cust.
*
*SELECT kn~kunnr
*       vk~bstnk
*       vp~kdmat
*  FROM kna1 AS kn
* INNER JOIN vbak AS vk
*    ON kn~kunnr = vk~kunnr
* INNER JOIN vbap AS vp
*    ON vk~vbeln = vp~vbeln
*  INTO TABLE it_cust.
*
*LOOP AT it_cust INTO wa_cust.
*  WRITE:/ wa_cust-kunnr,
*          wa_cust-bstnk,
*          wa_cust-kdmat.
*ENDLOOP.                               " LOOP AT it_cust...


"Question-6......
*
*Data: gv_name type c.
*
*gv_name = 'S4 HANA'.
*
*Write: gv_name

"Question-10.............

*write:/  'Date:',sy-Datum,
*      /  'Time:',sy-uzeit,
*      /  'User Name:',sy-uname,
*      /  'Language:',sy-langu.

"Question-12..........
* DATA: gv_value1 type I value 10,
*       gv_value2    type I value 5,
*       gv_res1      type I,
*       gv_res2      type I,
*       gv_final_res type I.
*
*gv_res1 = gv_value2 mod gv_value1.
*gv_res2 = gv_value1 div gv_value2.
*
*gv_final_res = gv_res1 + gv_res2.
*write: gv_final_res.


"Question-14.....
* Data: gv_date type Sy-datum.
* gv_date = sy-datum + 3.
* WRITE gv_date.


"Question-17.............

*TYPES: BEGIN OF ty_mara,
*         Matnr           TYPE matnr,
*         ersda           TYPE ersda,
*         created_at_time TYPE tims,
*         ernam           TYPE ernam,
*         laeda           TYPE laeda,
*       END OF ty_mara.
*
*DATA: it_mara TYPE TABLE OF ty_mara,
*      wa_mara TYPE ty_mara.
*
*SELECT matnr
*       ersda
*       created_at_time
*       ernam
*       laeda
*  FROM mara INTO TABLE it_mara.
*
*LOOP AT it_mara INTO wa_mara.
*
*  WRITE:/ wa_mara-matnr,
*          wa_mara-ersda,
*          wa_mara-created_at_time,
*          wa_mara-ernam,
*          wa_mara-laeda.
*ENDLOOP.

"Question-18..............

* TYPES: BEGIN OF ty_sales,
*        Customer(10) TYPE c,
*        Customer_Name(35) TYPE c,
*        VKORG(4) TYPE c,
*        VTWEG(2) TYPE c,
*        SPART(2) TYPE c,
*        END OF ty_sales.
*
* DATA: it_tab TYPE TABLE OF ty_sales,
*       wa_tab TYPE ty_sales.
*
* SELECT kn~kunnr
*        kn~name1
*        kv~vkorg
*        kv~vtweg
*        kv~spart
*   FROM knvp as kv INNER JOIN kna1 as kn on kv~kunnr = kn~kunnr
* INTO TABLE it_tab.
*
* LOOP AT it_tab INTO wa_tab.
*   WRITE:/ wa_tab-Customer,
*        15 wa_tab-Customer_Name,
*        55 wa_tab-vkorg,
*        62 wa_tab-vtweg,
*        66 wa_tab-spart.
* ENDLOOP.


"Question-19.....................

*TYPES: BEGIN OF ty_stdetails,
*       student_roll_no(5) TYPE n,
*       student_name(20) TYPE c,
*       Theory_marks TYPE i,
*       Practical_marks TYPE i,
*      END OF ty_stdetails.
*
*DATA: it_tab1 TYPE TABLE OF ty_stdetails,
*      wa_tab1 TYPE ty_stdetails.
*
*TYPES: BEGIN OF ty_marks,
*        student_roll_no(5) TYPE n,
*        student_name(20) TYPE c,
*        Grade TYPE c,
*       END OF ty_marks.
*
*DATA: it_tab2 TYPE TABLE OF ty_marks,
*      wa_tab2 TYPE ty_marks,
*      g_final TYPE i.
*
*wa_tab1-student_roll_no = '51653'.
*wa_tab1-student_name = 'Sai Teja'.
*wa_tab1-Theory_marks = '40'.
*wa_tab1-Practical_marks = '50'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51651'.
*wa_tab1-student_name = 'Tarun'.
*wa_tab1-Theory_marks = '35'.
*wa_tab1-Practical_marks = '40'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51652'.
*wa_tab1-student_name = 'Prashnath'.
*wa_tab1-Theory_marks = '30'.
*wa_tab1-Practical_marks = '30'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51654'.
*wa_tab1-student_name = 'Sandeep'.
*wa_tab1-Theory_marks = '25'.
*wa_tab1-Practical_marks = '25'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51655'.
*wa_tab1-student_name = 'Dhavan'.
*wa_tab1-Theory_marks = '28'.
*wa_tab1-Practical_marks = '43'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51656'.
*wa_tab1-student_name = 'Phani'.
*wa_tab1-Theory_marks = '34'.
*wa_tab1-Practical_marks = '56'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51657'.
*wa_tab1-student_name = 'Venkat'.
*wa_tab1-Theory_marks = '27'.
*wa_tab1-Practical_marks = '55'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51658'.
*wa_tab1-student_name = 'Berinath'.
*wa_tab1-Theory_marks = '22'.
*wa_tab1-Practical_marks = '57'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51659'.
*wa_tab1-student_name = 'Fathima'.
*wa_tab1-Theory_marks = '34'.
*wa_tab1-Practical_marks = '58'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51660'.
*wa_tab1-student_name = 'Sowmya'.
*wa_tab1-Theory_marks = '30'.
*wa_tab1-Practical_marks = '50'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51661'.
*wa_tab1-student_name = 'Likitha'.
*wa_tab1-Theory_marks = '23'.
*wa_tab1-Practical_marks = '56'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51662'.
*wa_tab1-student_name = 'Dileep'.
*wa_tab1-Theory_marks = '37'.
*wa_tab1-Practical_marks = '45'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51663'.
*wa_tab1-student_name = 'Aditya'.
*wa_tab1-Theory_marks = '24'.
*wa_tab1-Practical_marks = '53'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51664'.
*wa_tab1-student_name = 'Divakar'.
*wa_tab1-Theory_marks = '35'.
*wa_tab1-Practical_marks = '45'.
*APPEND wa_tab1 to it_tab1.
*
*wa_tab1-student_roll_no = '51665'.
*wa_tab1-student_name = 'RaVi'.
*wa_tab1-Theory_marks = '38'.
*wa_tab1-Practical_marks = '48'.
*APPEND wa_tab1 to it_tab1.
*
*LOOP AT it_tab1 INTO wa_tab1.
*g_final = wa_tab1-Theory_marks + wa_tab1-Practical_marks.
*
*IF g_final < 60.
*  wa_tab2-student_roll_no = wa_tab1-student_roll_no.
*  wa_tab2-student_name = wa_tab1-student_name.
*  wa_tab2-Grade = 'C'.
*  APPEND wa_tab2 to it_tab2.
*ELSEIF g_final < 70.
*  wa_tab2-student_roll_no = wa_tab1-student_roll_no.
*  wa_tab2-student_name = wa_tab1-student_name.
*  wa_tab2-Grade = 'B'.
*  APPEND wa_tab2 to it_tab2.
*ELSEIF g_final > 70.
*  wa_tab2-student_roll_no = wa_tab1-student_roll_no.
*  wa_tab2-student_name = wa_tab1-student_name.
*  wa_tab2-Grade = 'A'.
*  APPEND wa_tab2 to it_tab2.
*ENDIF.
*ENDLOOP.
*
*write sy-uline+0(42).
*
*write:/1 sy-vline,
*       3 'Student Roll no',20 sy-vline,
*       22 'Student Name', 35 sy-vline,
*       36 'Grade', 42 sy-vline.
*WRITE:/ sy-uline+0(42).
*
*LOOP AT it_tab2 INTO wa_tab2.
*  write:/1 sy-vline,
*         3 wa_tab2-Student_Roll_no,20 sy-vline,
*         22 wa_tab2-Student_Name, 35 sy-vline,
*         36 wa_tab2-Grade, 42 sy-vline.
*WRITE:/ sy-uline+0(42).
*
*ENDLOOP.
