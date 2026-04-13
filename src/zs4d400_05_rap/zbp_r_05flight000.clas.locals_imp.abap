CLASS LHC_ZR_05FLIGHT000 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
            IMPORTING keys FOR flight~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
            IMPORTING keys FOR flight~validateCurrencyCode.
ENDCLASS.

CLASS LHC_ZR_05FLIGHT000 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.


  METHOD validatePrice.
    data failed_record like line of failed-flight.
    data reported_record like line of reported-flight.

    read ENTITIES OF ZR_05FLIGHT000 IN LOCAL MODE
      ENTITY flight
        FIELDS ( price )
        WITH CORRESPONDING #(  keys )
           result data(flights).


     LOOP AT flights INTO DATA(flight).
     " Meldung ausgeben
         if flight-Price <= 0.
            reported_record-%tky = flight-%tky.

            reported_record-%msg = me->new_message(
                                        id = '/LRN/S4D400'
                                        number = '101'
                                        severity = if_abap_behv_message=>severity-error ).

            reported_record-%element-Price = if_abap_behv=>mk-on.

            APPEND reported_record to reported-flight.


*************************************************************************************
* Änderung zurücknehmen
            failed_record-%tky = flight-%tky.
            APPEND failed_record TO failed-flight.

         endif.
     Endloop.


  ENDMETHOD.

  METHOD validateCurrencyCode.
     data failed_record like line of failed-flight.
     data reported_record like line of reported-flight.
     data exists type abap_bool.



    read ENTITIES OF ZR_05FLIGHT000 IN LOCAL MODE
      ENTITY flight
        FIELDS ( CurrencyCode )
        WITH CORRESPONDING #(  keys )
           result data(flights).


      loop at flights INTO DATA(flight).

        select single from I_Currency FIELDS @abap_true
             where Currency = @flight-CurrencyCode INTO @exists.


        if exists <> abap_false.
            reported_record-%tky = flight-%tky.  "1 Abb 221 EN version

            reported_record-%msg = me->new_message(
                                        id = '/LRN/S4D400'
                                        number = '102'
                                        severity = if_abap_behv_message=>severity-error
                                        v1       =  flight-CurrencyCode ).    " 2 Abb 221 EN

            reported_record-%element-CurrencyCode = if_abap_behv=>mk-on.      "3 Abb 221 EN

            APPEND reported_record to reported-flight.
*************************************************************************************
* Änderung zurücknehmen
            failed_record-%tky = flight-%tky.
            APPEND failed_record TO failed-flight.

         endif.
     Endloop.

  ENDMETHOD.

ENDCLASS.
