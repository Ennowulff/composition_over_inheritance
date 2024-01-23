CLASS zcoi01_area_main DEFINITION
  PUBLIC
  CREATE PROTECTED.

  PUBLIC SECTION.
    INTERFACES zcoi01_area.
    CLASS-METHODS get_instance
      IMPORTING
        area          TYPE zcoi01_area~_area
      RETURNING
        VALUE(result) TYPE REF TO zcoi01_area.
  PROTECTED SECTION.
    DATA documents TYPE zcoi01_area~_documents.
    DATA area TYPE zcoi01_area~_area.
    DATA area_name TYPE string.
    DATA countries TYPE zcoi01_area~_countries.
    DATA responsible_person TYPE string.
    METHODS constructor
      IMPORTING
        area        TYPE zcoi01_area~_area
        name        TYPE string
        countries   TYPE zcoi01_area~_countries
        responsible TYPE string.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcoi01_area_main IMPLEMENTATION.
  METHOD zcoi01_area~add_document.
    IF line_exists( documents[ number = document-number ] ).
      result = abap_false.
    ELSE.
      documents = VALUE #( BASE documents ( document ) ).
      result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD zcoi01_area~delete_document.
    IF line_exists( documents[ number = number ] ).
      DELETE documents WHERE number = number.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD zcoi01_area~display.
    FORMAT COLOR COL_NORMAL.
    WRITE: / 'Area', area, zcoi01_area~get_name( ).
    WRITE: / 'Responsible is', zcoi01_area~get_responsible_person( ).
    WRITE: / 'Assigned countries:'.
    LOOP AT zcoi01_area~get_assigned_countries( ) INTO DATA(country).
      WRITE: country.
    ENDLOOP.
    WRITE: / 'Number of documents:', AT 30 lines( documents ).
    FORMAT COLOR OFF.
  ENDMETHOD.

  METHOD zcoi01_area~get_assigned_countries.
    result = countries.
  ENDMETHOD.

  METHOD zcoi01_area~get_documents.
    result = documents.
  ENDMETHOD.

  METHOD zcoi01_area~get_name.
    result = area_name.
  ENDMETHOD.

  METHOD zcoi01_area~get_responsible_person.
    result = responsible_person.
  ENDMETHOD.

  METHOD get_instance.

    DATA(class_name) = |ZCOI01_AREA_{ area }|.

    TRY.
        CREATE OBJECT result TYPE (class_name).
      CATCH cx_sy_create_object_error.
        result = NEW zcoi01_area_main(
                   area        = area
                   countries   = VALUE #( )
                   name        = |Area "{ area }"|
                   responsible = 'Master of the Universe' ).
    ENDTRY.

  ENDMETHOD.

  METHOD constructor.
    me->area               = area.
    me->countries          = countries.
    me->area_name          = name.
    me->responsible_person = responsible.
  ENDMETHOD.

ENDCLASS.

