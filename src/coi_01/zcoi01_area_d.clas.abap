CLASS zcoi01_area_d DEFINITION
  PUBLIC
  INHERITING FROM zcoi01_area_main
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcoi01_area_d IMPLEMENTATION.


  METHOD constructor.

    super->constructor(
        area        = 'D'
        name        = 'Draconia'
        responsible = 'Dania'
        countries   = VALUE #( ( 'IT ' ) ( 'GR ' ) )
      ).

    zcoi01_area~add_document( VALUE #(
      number = 9001
      title  = 'Template for customer'
      status = zcoi01_area=>status_released ) ).
    zcoi01_area~add_document( VALUE #(
      number = 9002
      title  = 'Template for technician'
      status = zcoi01_area=>status_released ) ).
  ENDMETHOD.


ENDCLASS.
