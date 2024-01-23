CLASS zcoi01_area_b DEFINITION
  PUBLIC
  INHERITING FROM zcoi01_area_main
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor.
    METHODS zcoi01_area~delete_document REDEFINITION.
    METHODS zcoi01_area~display REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcoi01_area_b IMPLEMENTATION.

  METHOD constructor.

    super->constructor(
        area        = 'B'
        name        = 'Brythoria'
        responsible = 'Bernard'
        countries   = VALUE #( ( 'ES ' ) ( 'PT ' ) ( 'FR ' ) )
      ).

  ENDMETHOD.

  METHOD zcoi01_area~display.

    "copied code from main class --> servant?
    WRITE: / 'Area', area, zcoi01_area~get_name( ).
    WRITE: / 'Responsible is', zcoi01_area~get_responsible_person( ).
    WRITE: / '  Telephone: 555 - 22 33 44-05'.
    WRITE: / 'Assigned countries:'.
    LOOP AT zcoi01_area~get_assigned_countries( ) INTO DATA(country).
      WRITE: country.
    ENDLOOP.
    WRITE: / 'Number of documents:', AT 30 lines( documents ).
  ENDMETHOD.


  METHOD zcoi01_area~delete_document.
    result = abap_false.
  ENDMETHOD.

ENDCLASS.
