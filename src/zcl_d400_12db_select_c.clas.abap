CLASS zcl_d400_12db_select_c DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_12db_select_c IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA lt_collection TYPE lcl_demo_01=>tab.              "Variante 1
    DATA lt_collection_1 TYPE TABLE OF REF TO lcl_demo_01. "Variante 2








*****************************************
    DATA ls_z00_customers TYPE z00_customers.
    SELECT SINGLE FROM z00_customers FIELDS * WHERE id = '000006'
                            INTO @ls_z00_customers    .
    IF sy-subrc = 0.
      out->write( ls_z00_customers ).
    ELSE.
      out->write( 'Der Kunde wurde nicht gefunden!' ).
    ENDIF.
**************************************************************************
    DATA lv_name TYPE c LENGTH 20.
    SELECT SINGLE FROM z00_customers FIELDS name WHERE id = '000007'
                      INTO @lv_name.
    IF sy-subrc = 0.
      out->write( lv_name ).
    ELSE.
      out->write( 'Der Kunde wurde nicht gefunden!' ).
    ENDIF.
***************************************************************************
    DATA lv_plz TYPE z00_customers-plz.
    SELECT SINGLE FROM z00_customers FIELDS name, plz WHERE id = '000007'
                      INTO (  @lv_name, @lv_plz ).
    IF sy-subrc = 0.
      out->write( lv_name ).
    ELSE.
      out->write( 'Der Kunde wurde nicht gefunden!' ).
    ENDIF.

****************************************************************************
    DATA lv_connection TYPE /dmo/connection-connection_id.




  ENDMETHOD.


ENDCLASS.
