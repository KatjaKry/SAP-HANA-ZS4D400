CLASS zcl_05_compute_case DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_compute_case IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     DATA lv_int1 TYPE i.
     DATA lv_int2 TYPE i.
     DATA lv_result TYPE p leNGTH 8 dECIMALS 2.
     DATA op TYPE c LENGTH 1.
     DATA output TYPE string.

    lv_int1 = 8.
    lv_int2 = 0.

    op = '/'.

case op.
  when '+'.
      lv_result = lv_int1 + lv_int2.
  when '-'.
      lv_result = lv_int1 - lv_int2.
  when '*'.
      lv_result = lv_int1 * lv_int2.
  when '/'.

    try.
        lv_result = lv_int1 / lv_int2.
*        Var 1
         catch cx_sy_zerodivide.
         output = |Division durch Null ist nicht definiert!| .
*       Var 2
*        catch cx_root INTO DATA(lx_root1).
*          output = lx_root1->get_text( ).
    endtry.

  whEN OTHERS.

         output = | '{ op }'  ist kein gültiger Operator! | .

endcase.

   IF output is INITIAL.

        output = | { lv_int1 } {  op } { lv_int2 } = { lv_result } | .
   ENDIF.


    out->write( output ).


  ENDMETHOD.
ENDCLASS.
