CLASS zcl_05_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_05_hello_world IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
     out->write(
       EXPORTING
         data   = 'Hello World-1' ).

     out->write( 'Hello World-2' ).

     DATA lv_demo_01 TYPE i VALUE 1000.

     out->write(  lv_demo_01 ).


  ENDMETHOD.
ENDCLASS.
