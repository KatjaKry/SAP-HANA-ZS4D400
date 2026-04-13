*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarationsCLASS lcl_connection DEFINITION .
CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i.

    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.

    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.


  PROTECTED SECTION.
  PRIVATE SECTION.








    TYPES BEGIN OF st_details.
    TYPES DepartureAirport TYPE   /dmo/airport_from_id.
    TYPES DestinationAirport TYPE   /dmo/airport_to_id.
    TYPES AirlineName TYPE  /dmo/carrier_name.
    TYPES END OF st_details.


    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.
    DATA carrier_name TYPE /dmo/carrier-name.  " /dmo/carrier_name arbeitet auch - in diese Fall das ist referencierung zu Datenelement- Oder spalte in Tabelle
    DATA details TYPE st_details.





ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.



  METHOD get_output.
    APPEND |------------------------------------| TO r_output.
    APPEND |Carrier: { carrier_id } {  details-AirlineName } | TO r_output.
    APPEND |Connection: { connection_id }| TO r_output.
    APPEND |Airport from: { details-DepartureAirport }| TO r_output.
    APPEND |Airport to: { details-DestinationAirport }| TO r_output.
  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    SELECT SINGLE FROM /dmo/I_Connection
      FIELDS DepartureAirport, DestinationAirport, \_Airline-Name AS AirlineName
         WHERE AirlineID = @i_carrier_id AND ConnectionID = @i_connection_id
            INTO CORRESPONDING FIELDS OF @details.





*     SELECT SINGLE FROM /dmo/connection
*        FIELDS airport_from_id, airport_to_id
*          WHERE carrier_id = @i_carrier_id AND connection_id = @i_connection_id
*            INTO ( @airport_from_id, @airport_to_id ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    conn_counter  = conn_counter + 1.

  ENDMETHOD.

ENDCLASS.
