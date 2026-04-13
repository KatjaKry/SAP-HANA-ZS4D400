CLASS zcl_05_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     DATA lv_int1 TYPE i.
     DATA lv_int2 TYPE i.
     DATA lv_result TYPE p leNGTH 8 dECIMALS 2.

    lv_int1 = -8.
    lv_int2 = 3.
    lv_result = lv_int1 / lv_int2.

*    DATA(lv_result) = lv_int1 / lv_int2.

    DATA(output) =  | { lv_int1 } / { lv_int2 } = { lv_result } | .

    out->write( output ).


  ENDMETHOD.
ENDCLASS.
