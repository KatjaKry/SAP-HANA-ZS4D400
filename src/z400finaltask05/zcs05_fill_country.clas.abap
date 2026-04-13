CLASS zcs05_fill_country DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcs05_fill_country IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_country TYPE zcs05_country.

    DELETE FROM zcs05_country.
    COMMIT WORK.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'DE'.
    ls_country-COUNTRYNAME = 'Germany'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'FR'.
    ls_country-COUNTRYNAME = 'France'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'US'.
    ls_country-COUNTRYNAME = 'USA'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'AU'.
    ls_country-COUNTRYNAME = 'Australia'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'CA'.
    ls_country-COUNTRYNAME = 'Canada'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'CH'.
    ls_country-COUNTRYNAME = 'Switzerland'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'CN'.
    ls_country-COUNTRYNAME = 'China'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'ES'.
    ls_country-COUNTRYNAME = 'Spain'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'GB'.
    ls_country-COUNTRYNAME = 'Great Britain'.

    INSERT zcs05_country FROM @ls_country.

    ls_country-client = sy-mandt.
    ls_country-COUNTRY = 'IN'.
    ls_country-COUNTRYNAME = 'India'.

    INSERT zcs05_country FROM @ls_country.







  ENDMETHOD.
ENDCLASS.
