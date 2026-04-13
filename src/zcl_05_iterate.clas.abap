CLASS zcl_05_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_05_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS max_count TYPE i VALUE 20.


    DATA lt TYPE TABLE OF i.
    DATA lt_output TYPE TABLE OF string.

    DO max_count TIMES.

      CASE sy-index.
        WHEN 1.
          APPEND 0 TO lt.

        WHEN 2.
          APPEND 1 TO lt.

        WHEN OTHERS.
          APPEND lt[  sy-index - 2 ] + lt[  sy-index - 1  ] TO lt.


      ENDCASE.

    ENDDO.

*  out->write(  lt ).

* Formatierung der Ausgabe

    LOOP AT lt INTO DATA(number).
      APPEND |{  sy-tabix WIDTH = 4 } : {  number WIDTH = 10 ALIGN = RIGHT } | TO lt_output.
    ENDLOOP.

    out->write(
      EXPORTING
         data = lt_output
         name = |Die ersten { max_count } Fibonacci Zahlen | ).

*    out->write(  lt_output ).

  ENDMETHOD.
ENDCLASS.
