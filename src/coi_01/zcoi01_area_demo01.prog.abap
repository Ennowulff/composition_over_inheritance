REPORT zcoi01_area_demo01.

PARAMETERS p_area TYPE c LENGTH 1 DEFAULT 'P'.

START-OF-SELECTION.

  DATA(my_area) = zcoi01_area_main=>get_instance( p_area ).

  my_area->add_document( VALUE #( number = 1 title = 'Book of releasing'        status = zcoi01_area=>status_released ) ).
  my_area->add_document( VALUE #( number = 2 title = 'Book of draft'            status = zcoi01_area=>status_draft ) ).
  my_area->add_document( VALUE #( number = 3 title = 'Open book of inheritance' status = zcoi01_area=>status_open ) ).
  my_area->add_document( VALUE #( number = 4 title = 'Open book of testing'     status = zcoi01_area=>status_open ) ).
  my_area->add_document( VALUE #( number = 5 title = 'Book of everything'       status = zcoi01_area=>status_released ) ).
  my_area->add_document( VALUE #( number = 6 title = 'Book to be deleted'       status = zcoi01_area=>status_released ) ).
  my_area->delete_document( 6 ).


  my_area->display( ).

  ULINE.

  FORMAT COLOR COL_HEADING.
  WRITE: / 'Documents', AT sy-linsz space.
  FORMAT COLOR OFF.

  LOOP AT my_area->get_documents( ) INTO DATA(doc).
    WRITE: / doc-number, doc-status, doc-title.
  ENDLOOP..
