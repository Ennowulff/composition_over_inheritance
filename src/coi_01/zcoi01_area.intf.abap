INTERFACE zcoi01_area
  PUBLIC.
  CONSTANTS:
    status_open     TYPE c LENGTH 1 VALUE 'o',
    status_released TYPE c LENGTH 1 VALUE 'r',
    status_draft    TYPE c LENGTH 1 VALUE 'd'.

  TYPES: _area       type c length 1,
         _doc_number TYPE i,
         _status     TYPE c LENGTH 1,
         _countries  TYPE SORTED TABLE OF land1 WITH UNIQUE DEFAULT KEY,
         BEGIN OF _document,
           number TYPE _doc_number,
           title  TYPE string,
           status TYPE _status,
         END OF _document,
         _documents TYPE SORTED TABLE OF _document WITH UNIQUE KEY number
                                                   WITH non-UNIQUE SORTED KEY status COMPONENTS status.

  METHODS:
    get_name
      RETURNING
        VALUE(result) TYPE string,
    get_documents
      RETURNING
        VALUE(result) TYPE _documents,
    add_document
      IMPORTING
        document      TYPE _document
      RETURNING
        VALUE(result) TYPE abap_bool,
    delete_document
      IMPORTING
        number        TYPE _doc_number
      RETURNING
        VALUE(result) TYPE abap_bool,
    get_responsible_person
      RETURNING
        VALUE(result) TYPE string,
    get_assigned_countries
      RETURNING
        VALUE(result) TYPE _countries,
    display.
ENDINTERFACE.
