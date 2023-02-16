*&---------------------------------------------------------------------*
*& Report Z1013492_DATAOBS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1013492_dataobs.

*DATA: g_char type char10,
*      g_int type i.
*
*g_int = '65744'.
*
*move g_int to g_char.
*
*write:/'char',g_char,
*     /  'int', g_int.


*DATA: g_packed type p,
*      g_float type f.
*
*g_float = 5643572.
*
*g_packed = g_float.
*
*WRITE:/'float',g_float,
*      / 'packed',g_packed.

*
*DATA: g_char(6) type c VALUE '6767',
*      g_int  type i,
*      g_numc(6) type n,
*      g_float type f,
*      g_string type string,
*      g_packed type p.
*
*
*move: g_char to g_int,
*      g_char to g_numc,
*      g_char to g_float,
*      g_char to g_string,
*      g_char to g_packed.
*
*write:/'char',g_char,
*
*      / 'int',g_int,
*
*      / 'numc',g_numc,
*
*      / 'float',g_float,
*
*      / 'string',g_string,
*
*      / 'packed',g_packed.


*DATA: g_packed type p VALUE '12345678910123'.
*WRITE: g_packed.

*PARAMETERS g_packed type p.
*WRITE: g_packed.


*PARAMETERS: g_char(6) TYPE c,
*            g_int     TYPE i,
*            g_numc(6) TYPE n,
**      g_float type f,
*            g_string  TYPE string,
*            g_packed  TYPE p.
*
*
*MOVE: g_char TO g_int,
*      g_char TO g_numc,
*      g_char TO g_float,
*      g_char TO g_string,
*      g_char TO g_packed.
*
*WRITE:/'char',g_char,
*
*      / 'int',g_int,
*
*      / 'numc',g_numc,
*
*      / 'float',g_float,
*
*      / 'string',g_string,
*
*      / 'packed',g_packed.

*DATA: g_int  TYPE i VALUE '1234',
*      g_char(4) TYPE c.
*
*g_char = g_int.
*WRITE:/ g_int,
*        g_char.
*
*DATA: g_float type F VALUE '1234567891011121'.
*write:/ g_float.

*PARAMETERS: g_int  TYPE i.
*
*DATA: g_float type f,
*      g_hex(1) type x.
*move: g_int to g_float,
*      g_int to g_hex.
*write:/ g_int,
*      / g_float,
*      / g_hex.

*data: g_hex type x value 65.
*write: g_hex.

*
*data: g_char(8) type c VALUE 'ddmmyyyy',
*      g_date type dats,
*      g_time type tims.
*
*g_date = g_char.
*g_time = g_char.
*
*WRITE:/ g_char,
*       g_date,
*       g_time.

*DATA: g_int type i VALUE 54210,
*      g_ch(15) type c.
*g_ch = g_int.
*write:/ g_int,
*       / g_ch.

*PARAMETERS: g_char(10) type c.
*WRITE g_char.
*
*DATA: g_char(2) type c VALUE '15',
*      g_hex type x.
*
*g_hex = g_char.
*write: g_char,
*       g_hex.


parameters g_numc type string.
data g_hex type x.
move g_numc to g_hex.

write: g_numc,
       g_hex.
