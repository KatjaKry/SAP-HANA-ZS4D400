CLASS zcl_05_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data agencies_upd type table for UPDATE /DMO/I_AgencyTP.
    agencies_upd = VALUE #( ( AgencyID = '070005' Name = 'Demo_change Group 05' )  ).

    MODIFY ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency
          UPDATE FIELDS (  Name ) WITH agencies_upd.
    COMMIT ENTITIES.

    out->write(  'Anderungen wurden durchgeführt.' ).




*    MODIFY ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency

*********************************************************************************
* Seite 312 Ausgabe (Keine Aufgabe 17).

   DATA input_keys TYPE TABLE FOR READ IMPORT /DMO/I_AgencyTP.
   DATA result_keys TYPE TABLE FOR READ RESULT /DMO/I_AgencyTP.

    READ ENTITIES OF /DMO/I_AgencyTP
      ENTITY /DMO/Agency
      ALL FIELDS WITH input_keys
      RESULT result_keys.

*    out->write(  result_keys ).
 ENDMETHOD.
ENDCLASS.

