*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_ASSIGNMENT_1.
PARAMETERS:
*Variable to hold the data.
           p_data TYPE string.
TYPES:
*Structure to hold the Vendor Details
      BEGIN OF ty_str,
         lifnr TYPE lifnr,
         ebeln TYPE ebeln,
         lponr TYPE lponr,
       END OF ty_str.

DATA:
*Internal Table to hold  the Vendor Details
        it_tab TYPE TABLE OF ty_str,
*Work area to hold the Vendor Details
        wa_tab TYPE ty_str.

TYPES:
*structure to hold the Customer Details
       BEGIN OF ty_str1,
         kunnr TYPE kunnr,
     name1(35) TYPE c,
         bsark TYPE bsark,
       END   OF ty_str1.

DATA:
*Internal table to hold the Customer Details
      it_tab1 TYPE TABLE OF ty_str1,
*Work Ares to hold the Customer Details
      wa_tab1 TYPE ty_str1.

SELECT lf~lifnr
       ek~ebeln
       ek~lponr
  FROM lfa1 AS lf
 INNER JOIN ekko AS ek
    ON lf~lifnr = ek~lifnr
  INTO TABLE it_tab.          "Selecting the Data....

SELECT kn~kunnr
       kn~name1
       vk~bsark
  FROM kna1 AS kn
 INNER JOIN vbak AS vk
    ON kn~kunnr = vk~kunnr
  INTO TABLE it_tab1.                  "Selecting the Data......


IF sy-subrc = 0.
  LOOP AT it_tab INTO wa_tab.
    IF p_data = wa_tab-lifnr.
        WRITE:/ wa_tab-lifnr,
                wa_tab-ebeln,
                wa_tab-lponr.
    ENDIF.
  ENDLOOP.                            "Loop at it_tab...

  LOOP AT it_tab1 INTO wa_tab1.
    IF p_data = wa_tab1-kunnr.

      WRITE:/ wa_tab1-kunnr,
              wa_tab1-name1,
              wa_tab1-bsark.
    ENDIF.
  ENDLOOP.                             "Loop at it_tab1...
ELSE.
  MESSAGE TEXT-001 TYPE 'E'.
ENDIF.
