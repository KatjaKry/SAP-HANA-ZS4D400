*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarationsCLASS lcl_connection DEFINITION .
CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    CLASS-DATA conn_counter TYPE i.

    METHODS get_output
      returning VALUE(r_output) TYPE string_table.

    METHODS set_attribites
      IMPORTING
        i_carrier_id TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.



  METHOD get_output.
     APPEND |------------------------------------| to r_output.
     APPEND |Carrier: { carrier_id }| TO r_output.
     APPEND |Connection: { connection_id }| TO r_output.
  ENDMETHOD.

  METHOD set_attribites.
     IF i_carrier_id IS initial or i_connection_id is initial.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
     ENDIF.
     carrier_id = i_carrier_id.
     connection_id = i_connection_id.
     conn_counter  = conn_counter + 1.

  ENDMETHOD.

ENDCLASS.
