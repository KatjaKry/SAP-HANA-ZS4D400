CLASS zcs05_fill_postcode DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcs05_fill_postcode IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_postcode TYPE zcs05_postcode.

    DELETE FROM zcs05_postcode.
    COMMIT WORK.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '10115'.
    ls_postcode-CITY = 'Berlin'.
    ls_postcode-COUNTRY = 'DE'.

    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '40211'.
    ls_postcode-CITY = 'Düsseldorf'.
    ls_postcode-COUNTRY = 'DE'.
    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '53111'.
    ls_postcode-CITY = 'Bonn'.
    ls_postcode-COUNTRY = 'DE'.
    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '80333'.
    ls_postcode-CITY = 'München'.
    ls_postcode-COUNTRY = 'DE'.
    INSERT zcs05_postcode FROM @ls_postcode.


    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '51503'.
    ls_postcode-CITY = 'Rösrath'.
    ls_postcode-COUNTRY = 'DE'.

    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '50670'.
    ls_postcode-CITY = 'Köln'.
    ls_postcode-COUNTRY = 'DE'.

    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '60308'.
    ls_postcode-CITY = 'Frankfurt'.
    ls_postcode-COUNTRY = 'DE'.

    INSERT zcs05_postcode FROM @ls_postcode.


    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '33098'.
    ls_postcode-CITY = 'Paderborn'.
    ls_postcode-COUNTRY = 'DE'.

    INSERT zcs05_postcode FROM @ls_postcode.


    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '55122'.
    ls_postcode-CITY = 'Mainz'.
    ls_postcode-COUNTRY = 'DE'.

    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '79110'.
    ls_postcode-CITY = 'Freiburg'.
    ls_postcode-COUNTRY = 'DE'.

    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '75000'.
    ls_postcode-CITY = 'Paris'.
    ls_postcode-COUNTRY = 'FR'.

    INSERT zcs05_postcode FROM @ls_postcode.


    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '06100'.
    ls_postcode-CITY = 'Nice'.
    ls_postcode-COUNTRY = 'FR'.

    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '20005'.
    ls_postcode-CITY = 'Washington'.
    ls_postcode-COUNTRY = 'USA'.

    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '065605'.
    ls_postcode-CITY = 'Peking'.
    ls_postcode-COUNTRY = 'CN'.

    INSERT zcs05_postcode FROM @ls_postcode.

    ls_postcode-client = sy-mandt.
    ls_postcode-POSTCODE = '8001'.
    ls_postcode-CITY = 'Zürich'.
    ls_postcode-COUNTRY = 'CH'.

    INSERT zcs05_postcode FROM @ls_postcode.

  ENDMETHOD.
ENDCLASS.
