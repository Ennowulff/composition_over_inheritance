CLASS zcoi01_area_c DEFINITION
  PUBLIC
  INHERITING FROM zcoi01_area_main
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor.
    METHODS zcoi01_area~add_document REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcoi01_area_c IMPLEMENTATION.


  METHOD constructor.

    super->constructor(
        area        = 'C'
        name        = 'Celestria'
        responsible = 'Carolina'
        countries   = VALUE #( ( 'PL ' ) ( 'RO ' ) )
      ).

  ENDMETHOD.


  METHOD zcoi01_area~add_document.

    INSERT VALUE #(
      number = document-number
      title  = document-title
      status = zcoi01_area=>status_draft ) INTO TABLE documents.

  ENDMETHOD.
ENDCLASS.
