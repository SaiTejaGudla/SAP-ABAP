*&---------------------------------------------------------------------*
*& Report Z1013492_PRG1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_PRG1.
*
*parameters p_teja(30) type c.
*P_TEJA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD'.
*
*write p_teja.

data name(10) type c.
name = 'jkyusagufs'.
*write name.




*declaration


*varibales.

*data name1 type c.
data name3 like name.
write name3.

types: name4 like name,
       name6 like name3.
data: name4, name6.
name4 = 'ewrwr'.
name6 = 'hdafsj'.


*data: name5 type zdbranch,

* name6 type ZDSTRUCTURE.
*constants name7 type name value ' wjhjwuhgugug'.
*write name7.


*work area.
types: begin of khdfs,
  wa1 type string,
  wa2 type c,
  wa3 type n,
  end of khdfs.

  data wa4 type khdfs.
  data wa5 like ZDSTRUCTURE.



*internal tables
*with headerlines.
 data: BEGIN OF ZDSTRUCTURE occurs 0,
      address type ZDSTRUCTURE-address,
   country type ZDSTRUCTURE-country,
   END OF ZDSTRUCTURE.

*without headerlines.

   types: BEGIN OF ZDSTRUCTURE,
      address type ZDSTRUCTURE-address,
   country type ZDSTRUCTURE-country,
   END OF ZDSTRUCTURE.

data: table2 type table of zdstructure.
