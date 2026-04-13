CLASS zcs05_fill_customer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcs05_fill_customer IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_customer TYPE zcs05_customer.

    DELETE FROM zcs05_customer.
    COMMIT WORK.

    ls_customer-client = sy-mandt.
    ls_customer-customerid = '010000'.
    ls_customer-salutation = 'Frau'.
    ls_customer-LAST_NAME = 'Kryuchko'.
    ls_customer-FIRST_NAME = 'Katja'.
    ls_customer-STREET = 'Hauptstrasse'.
    ls_customer-CITY = 'Köln'.
    ls_customer-COUNTRY = 'DE'.
    ls_customer-POSTCODE = '50670'.
    INSERT zcs05_customer FROM @ls_customer.


    ls_customer-client = sy-mandt.
    ls_customer-customerid = '020000'.
    ls_customer-salutation = 'Herr'.
    ls_customer-LAST_NAME = 'Wagner'.
    ls_customer-FIRST_NAME = 'Jorg'.
    ls_customer-STREET = 'Bahnhofstrasse'.
    ls_customer-CITY = 'Berlin'.
    ls_customer-COUNTRY = 'DE'.
    ls_customer-POSTCODE = '10115'.
    INSERT zcs05_customer FROM @ls_customer.

    ls_customer-client = sy-mandt.
    ls_customer-customerid = '030000'.
    ls_customer-salutation = 'Herr'.
    ls_customer-LAST_NAME = 'Bormann'.
    ls_customer-FIRST_NAME = 'Magnus'.
    ls_customer-STREET = 'Bleifelderstrasse'.
    ls_customer-CITY = 'Paderborn'.
    ls_customer-COUNTRY = 'DE'.
    ls_customer-POSTCODE = '33098'.
    INSERT zcs05_customer FROM @ls_customer.

    ls_customer-client = sy-mandt.
    ls_customer-customerid = '040000'.
    ls_customer-salutation = 'Herr'.
    ls_customer-LAST_NAME = 'Puschmann'.
    ls_customer-FIRST_NAME = 'Ingo'.
    ls_customer-STREET = 'Sundgauallee'.
    ls_customer-CITY = 'Freiburg'.
    ls_customer-COUNTRY = 'DE'.
    ls_customer-POSTCODE = '79110'.
    INSERT zcs05_customer FROM @ls_customer.

    ls_customer-client = sy-mandt.
    ls_customer-customerid = '050000'.
    ls_customer-salutation = 'Frau'.
    ls_customer-LAST_NAME = 'Wagner'.
    ls_customer-FIRST_NAME = 'Isabella'.
    ls_customer-STREET = 'Schildergasse'.
    ls_customer-CITY = 'Mainz'.
    ls_customer-COUNTRY = 'DE'.
    ls_customer-POSTCODE = '55122'.
    INSERT zcs05_customer FROM @ls_customer.

  ENDMETHOD.
ENDCLASS.
