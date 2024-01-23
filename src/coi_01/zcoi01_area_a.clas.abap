CLASS zcoi01_area_a DEFINITION
  PUBLIC
  INHERITING FROM zcoi01_area_main
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor.
    METHODS zcoi01_area~get_documents REDEFINITION.
    METHODS zcoi01_area~display REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcoi01_area_a IMPLEMENTATION.

  METHOD constructor.

    super->constructor(
        area        = 'A'
        name        = 'Avaloria'
        responsible = 'Aaron'
        countries   = VALUE #( ( 'AT ' ) ( 'CH ' ) ( 'DE ' ) )
      ).

  ENDMETHOD.

  METHOD zcoi01_area~display.
    super->zcoi01_area~display( ).
    DATA(num_doc_released) = REDUCE i(
      INIT num = 0
      FOR doc IN documents
      USING KEY status
      WHERE ( status = zcoi01_area~status_released )
      NEXT num = num + 1  ).
    WRITE: / 'number of released documents:', AT 30 num_doc_released.
    DATA(num_doc_open) = REDUCE i(
      INIT num = 0
      FOR doc IN documents
      USING KEY status
      WHERE ( status = zcoi01_area~status_open )
      NEXT num = num + 1  ).
    WRITE: / 'number of open documents:', AT 30 num_doc_open.
  ENDMETHOD.

  METHOD zcoi01_area~get_documents.
    result = FILTER #( documents USING KEY status WHERE status = zcoi01_area~status_released ).
  ENDMETHOD.

ENDCLASS.
