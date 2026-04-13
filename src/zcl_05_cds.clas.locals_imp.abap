*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarationsCLASS lcl_connection DEFINITION .
CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i.

    METHODS get_output
      returning VALUE(r_output) TYPE string_table.

    METHODS constructor
      IMPORTING
        i_carrier_id TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.


  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /DMO/AIRPORT_FROM_ID.
    DATA airport_to_id TYPE /DMO/AIRPORT_TO_ID.
    DATA carrier_name TYPE /dmo/carrier-name.  " /dmo/carrier_name arbeitet auch - in diese Fall das ist referencierung zu Datenelement- Oder spalte in Tabelle

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.



  METHOD get_output.
     APPEND |------------------------------------| to r_output.
     APPEND |Carrier: { carrier_id } {  carrier_name } | TO r_output.
     APPEND |Connection: { connection_id }| TO r_output.
     APPEND |Airport from: { airport_from_id }| TO r_output.
     APPEND |Airport to: { airport_to_id }| TO r_output.
  ENDMETHOD.

  METHOD constructor.
     IF i_carrier_id IS initial or i_connection_id is initial.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
     ENDIF.

   select single from /dmo/I_Connection
     FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
        WHERE AirlineID = @i_carrier_id AND ConnectionID = @i_connection_id
           INTO (  @airport_from_id, @airport_to_id, @carrier_name ).





*     SELECT SINGLE FROM /dmo/connection
*        FIELDS airport_from_id, airport_to_id
*          WHERE carrier_id = @i_carrier_id AND connection_id = @i_connection_id
*            INTO ( @airport_from_id, @airport_to_id ).

     if sy-subrc <> 0.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
     ENDIF.

     carrier_id = i_carrier_id.
     connection_id = i_connection_id.
     conn_counter  = conn_counter + 1.

  ENDMETHOD.

ENDCLASS.
