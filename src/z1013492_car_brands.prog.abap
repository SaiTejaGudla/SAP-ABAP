*&---------------------------------------------------------------------*
*& Report Z1013492_ASSIGNMENT_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z1013492_CAR_BRANDS.

TYPES:
"Structure to hold the Car Details
      BEGIN OF ty_car,
       Brand TYPE string,
        Top1 TYPE string,
        Top2 TYPE string,
        Top3 TYPE string,
        END OF ty_car.

 DATA:
 "Internal Table to Store the Car Details
      it_car TYPE TABLE of ty_car,
 "Work Area to Store the car Deatils
      wa_car TYPE ty_car.

wa_car-Brand = 'Maruthi'.
wa_car-Top1  = 'Alto'.
wa_car-Top2  = 'Swift'.
wa_car-Top3  = 'Dzire'.

APPEND wa_car to it_car.

wa_car-Brand = 'Hyundai'.
wa_car-Top1  = 'Eon'.
wa_car-Top2  = 'Grand i10'.
wa_car-Top3  = 'i20'.
APPEND wa_car to it_car.

wa_car-Brand = 'Toyota'.
wa_car-Top1  = 'Fortuner'.
wa_car-Top2  = 'Innova'.
wa_car-Top3  = 'Glanza'.
APPEND wa_car to it_car.

write sy-uline+0(46).

write:/1  sy-vline,
       3 'Brand', 16 sy-vline,
       18 'Top1', 26 sy-vline,
       28 'Top2', 36 sy-vline,
       38 'Top3', 46 sy-vline.

write:/ sy-uline+0(46).

LOOP AT it_car INTO wa_car.
write:/1  sy-vline,
       3 wa_car-Brand, 16 sy-vline,
       18 wa_car-Top1, 26 sy-vline,
       27 wa_car-Top2, 36 sy-vline,
       38 wa_car-TOp3, 46 sy-vline.
write:/ sy-uline+0(46).

ENDLOOP.                               "Loop at it_car...
