CLASS LHC_ZR_CS05_CUSTOMER DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR CUSTOMER05
        RESULT result.

    METHODS DetermineCity FOR DETERMINE ON MODIFY
      IMPORTING keys FOR CUSTOMER05~DetermineCity.




ENDCLASS.

CLASS LHC_ZR_CS05_CUSTOMER IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.


  ENDMETHOD.

  METHOD DetermineCity.

  DATA lv_city TYPE zcs05_customer-city.
  DATA lv_postcode TYPE zcs05_customer-postcode.

  LOOP AT keys INTO DATA(lv_key).

    " lesen Postcode von Draft
    READ ENTITIES OF ZR_CS05_CUSTOMER
      IN LOCAL MODE
      ENTITY CUSTOMER05
      FIELDS ( Postcode )
      WITH VALUE #( ( %tky = lv_key-%tky ) )
      RESULT DATA(ls_customer).

    IF lines( ls_customer ) > 0.

      " erhalten Postcode
      lv_postcode = ls_customer[ 1 ]-Postcode.

      "suchen nach Postcode in die Tabelle
      SELECT SINGLE city
        FROM zcs05_postcode
        WHERE postcode = @lv_postcode
        INTO @lv_city.

      IF sy-subrc = 0.
        " update CITY im draft
        MODIFY ENTITIES OF ZR_CS05_CUSTOMER
          ENTITY CUSTOMER05
          UPDATE FIELDS ( city )
          WITH VALUE #( ( %tky = lv_key-%tky
                          city  = lv_city ) ).
      ENDIF.
    ENDIF.

  ENDLOOP.

ENDMETHOD.


ENDCLASS.
