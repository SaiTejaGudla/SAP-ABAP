*&---------------------------------------------------------------------*
*& Report Z3492_FOODTAB
*&---------------------------------------------------------------------*
*&
*&-------------------------------------------------------------------*
REPORT z3492_foodtab.

DATA: Total     TYPE i,
      T_Disc    TYPE i,
      T_Gst     TYPE i,
      T1        TYPE f,
      T2 TYPE f,
      Temp_Cost TYPE i VALUE '0',
      Temp_Disc TYPE i,
      Cost      TYPE i,
      Temp_Gst  TYPE i.
DATA lv_Rest TYPE z3492_resttab-rest_name.
DATA lv_food TYPE z3492_resttab-food_cat.
DATA lv_ITEM TYPE z3492_resttab-ITEM_name.
DATA lv_PRICE TYPE z3492_PRICEtab-price.
DATA lv_RATING TYPE z3492_RATINGTAB-ratings.
SELECT-OPTIONS:Restname FOR lv_rest NO INTERVALS,
                 foodcat FOR lv_FOOD,
                 item FOR lv_ITEM,
                 price FOR lv_PRICE NO INTERVALS,
                 rating FOR lv_RATING NO INTERVALS.
PARAMETERS Qnty TYPE c.
PARAMETERS Comments TYPE string.
TYPES: BEGIN OF ty_food,
         Restrant TYPE z3492_resttab-rest_name,
         Foodcat  TYPE z3492_resttab-food_cat,
         Item     TYPE z3492_resttab-ITEM_name,
         Price    TYPE z3492_pricetab-price,
         Rating   TYPE z3492_ratingtab-ratings,
         Comments TYPE z3492_RATINGTAB-ratings,
       END OF ty_food.

DATA: it_food TYPE TABLE OF ty_food,
      wa_food TYPE ty_food.

SELECT  re~rest_name
        re~food_cat
        re~Item_name
        pr~Price
        rt~Ratings
  FROM z3492_resttab AS re INNER JOIN z3492_pricetab AS pr ON re~rest_name = pr~rest_name
  INNER JOIN z3492_ratingtab AS rt ON re~rest_name = rt~rest_name INTO TABLE it_food
  WHERE re~rest_name IN restname AND re~food_cat IN foodcat AND re~item_name IN item.


WRITE sy-uline+0(130).

WRITE:/1 sy-vline,
       5 'Restrant', 30 sy-vline,
       35'Foodcat',47 sy-vline,
       52 'Item', 70 sy-vline,
       75 'Qnty', 83 sy-vline,
       88 'Price', 98 sy-vline,
       103 'Rating',109 sy-vline,
       115 'Comments',130 sy-vline.

WRITE sy-uline+0(130).

*IF Total >= 1000 AND Qnty >= 10.
*  T_Disc = Total * ( 20 / 100 ).
*ELSEIF Total >= 1000.
*  T_Disc = Total * ( 10 / 100 ).
*  WRITE: T_Disc.
*ELSEIF Qnty >= 10.
*  T_Disc = Total * ( 5 / 100 ).
*ELSEIF foodcat = 'MAINCOURSE' AND foodcat = 'BEVERAGES'.
*  T_Disc = Total * ( 5 / 100 ).
*ENDIF.

LOOP AT it_food INTO wa_food.

  IF Qnty > 1.
    Temp_Cost = wa_food-Price * Qnty.
  ELSE.
    Temp_Cost = Wa_food-price.
  ENDIF.
  Cost = Cost + Temp_cost.

  WRITE:/1 sy-vline,
         5 wa_food-Restrant,30 sy-vline,
         35 wa_food-Foodcat,47 sy-vline,
         52 wa_food-Item,70 sy-vline,
         75 Qnty,83 sy-vline,
         88 wa_food-Price,98 sy-vline,
         103 wa_food-Rating,109 sy-vline,
         115 wa_food-comments,130 sy-vline.
  WRITE sy-uline+0(130).

ENDLOOP.


IF Cost GE 1000.
  T1 = ( 10 / 100 ).
  Temp_Disc = T1 * Cost.
  T_Disc = Cost - Temp_Disc.

ELSEIF Qnty > 10.
  T1 = ( 5 / 100 ).
  Temp_Disc = T1 * Cost.
  T_Disc = Cost - Temp_Disc.

ELSEIF Cost >= 1000 AND Qnty >= 10.
  T1 = ( 20 / 100 ).
  Temp_Disc = T1 * Cost.
  T_Disc = Cost - Temp_Disc.

ELSEIF foodcat = ' MAINCOURSE '  AND foodcat = ' BEVERAGES ' .
  T1 = ( 5 / 100 ).
  Temp_Disc = T1 * Cost.
  T_Disc = Cost - Temp_Disc.

ELSE.
  T_Disc = Cost.

ENDIF.
IF Cost > 0.
  T2 =  ( 18 / 100 ).
  Temp_Gst = T2 * T_Disc.
  T_Gst = Temp_Gst + T_Disc.
ENDIF.

WRITE:/0 sy-vline,
       10 'Total', 83 sy-vline,
       88 Cost, 98 sy-vline,
       130 sy-vline.
WRITE: sy-uline+0(130).
WRITE:/0 sy-vline,
       10 'Total Discount', 83 sy-vline,
       88 T_Disc , 98 sy-vline,
       130 sy-vline.
WRITE:/ sy-uline+0(130).
WRITE:/0 sy-vline,
       10 'GST', 83 sy-vline,
       88 T_Gst, 98 sy-vline,
       130 sy-vline.
WRITE:/ sy-uline+0(130).
