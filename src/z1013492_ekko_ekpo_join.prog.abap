*&---------------------------------------------------------------------*
*& Report Z1013492_EKKO_EKPO_JOIN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_EKKO_EKPO_JOIN.

TYPES:
        BEGIN OF ty_join,
          ebeln TYPE ekko-ebeln,
          lifnr TYPE ekko-lifnr,
          ekorg TYPE ekko-ekorg,
          ebeln1 TYPE ekpo-ebeln,
          werks TYPE ekpo-werks,
          matnr TYPE ekpo-matnr,
       END OF ty_join.




DATA:
       It_join TYPE TABLE OF ty_join,
       wa_join TYPE ty_join.

SELECT ekko~ebeln
       ekko~lifnr
       ekko~ekorg
       ekpo~werks
       ekpo~matnr
 FROM ekko
 INNER JOIN ekpo
    on ekko~ebeln = ekpo~ebeln
  INTO TABLE it_join.

LOOP AT it_join INTO wa_join.

  WRITE:/ wa_join-ebeln,
          wa_join-lifnr,
          wa_join-ekorg,
          wa_join-matnr,
          wa_join-ebeln1,
          wa_join-matnr.
ENDLOOP.
