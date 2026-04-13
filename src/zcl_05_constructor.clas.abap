CLASS zcl_05_constructor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_constructor IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.            " Objektreferenz kann max. ein Object referenzieren.
    DATA connections  TYPE TABLE OF REF TO lcl_connection. " Collection, kann mehrere Odjecte enthalten
    DATA lx_invalid_value TYPE REF TO cx_abap_invalid_value.

* 1 Instance
**********************************************************************
*   connection = NEW lcl_connection( ).
      TRY.
       connection = new #(
            i_carrier_id    = 'LH'
            i_connection_id = '0400'
          ).
          APPEND connection to connections.
        CATCH cx_abap_invalid_value INTO lx_invalid_value.
          out->write(  lx_invalid_value->get_text( ) ).

        CATCH cx_root into data(lx_root).
         out->write(  lx_root->get_text(  ) ).
      ENDTRY.


*
*      connection->carrier_id = 'LH'.
*      connection->connection_id = '0400'.
*      APPEND connection to connections.

* 2 Instance
**********************************************************************
*      connection = NEW lcl_connection( ).
      TRY.
          connection = NEW #(
            i_carrier_id    = 'AA'
            i_connection_id = '0017'
          ).
          APPEND connection to connections.
        CATCH cx_abap_invalid_value INTO lx_invalid_value.
          out->write(  lx_invalid_value->get_text( ) ).
      ENDTRY.


*
*      connection->carrier_id = 'AA'.
*      connection->connection_id = '0017'.
*      APPEND connection to connections.



* 3 Instance
**********************************************************************
*      connection = NEW lcl_connection( ).
      TRY.
          connection = NEW #(
            i_carrier_id    = 'SQ'
            i_connection_id = '0001'
          ).
          APPEND connection to connections.
        CATCH cx_abap_invalid_value INTO lx_invalid_value.
          out->write(  lx_invalid_value->get_text( ) ).
      ENDTRY.



*      connection->carrier_id = 'SQ'.
*      connection->connection_id = '0001'.
*      APPEND connection to connections.

*      out->write( connections ).

      LOOP AT connections INTO connection.
       out->write(  connection->get_output(  ) ).
      ENDLOOP.
     out->write(  'Anzahl der Flugverbindungen: '  && conv string(  lcl_connection=>conn_counter ) ).

  ENDMETHOD.
ENDCLASS.
