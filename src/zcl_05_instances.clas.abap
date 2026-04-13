 CLASS zcl_05_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_instances IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.            " Objektreferenz kann max. ein Object referenzieren.
    DATA connections  TYPE TABLE OF REF TO lcl_connection. " Collection, kann mehrere Odjecte enthalten


      connection = NEW lcl_connection( ).
      connection->carrier_id = 'LH'.
      connection->connection_id = '0400'.
      APPEND connection to connections.

      connection = NEW lcl_connection( ).
      connection->carrier_id = 'AA'.
      connection->connection_id = '0017'.
      APPEND connection to connections.

      connection = NEW lcl_connection( ).
      connection->carrier_id = 'SQ'.
      connection->connection_id = '0001'.
      APPEND connection to connections.

      out->write( connections ).

  ENDMETHOD.
ENDCLASS.
