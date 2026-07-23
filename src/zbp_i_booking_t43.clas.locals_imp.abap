CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Booking RESULT result.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR booking RESULT result.

    METHODS earlynumbering_create_booking FOR NUMBERING
      IMPORTING entities FOR CREATE Booking.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
    READ ENTITIES OF zi_booking_t43 IN LOCAL MODE
      ENTITY Booking FIELDS ( OverallStatus )
      WITH CORRESPONDING #( keys ) RESULT DATA(lt) FAILED failed.

    result = VALUE #( FOR b IN lt (
      %tky    = b-%tky
      %update = COND #( WHEN b-OverallStatus = 'X'
                        THEN if_abap_behv=>auth-unauthorized ELSE if_abap_behv=>auth-allowed )
      %delete = COND #( WHEN b-OverallStatus = 'X'
                        THEN if_abap_behv=>auth-unauthorized ELSE if_abap_behv=>auth-allowed )
    ) ).
  ENDMETHOD.

  METHOD earlynumbering_create_booking.
     " Get current max bookingId in table
    SELECT SINGLE FROM zbooking_t43
      FIELDS MAX( booking_id ) AS max_id
      INTO @DATA(lv_max_id).

    DATA(lv_next) = COND i( WHEN lv_max_id IS INITIAL
                                 THEN 0
                                 ELSE lv_max_id+1(3) ).

    LOOP AT entities INTO DATA(ls_entity).
      lv_next += 1.

      APPEND VALUE #( %cid           = ls_entity-%cid
                      %is_draft      = ls_entity-%is_draft
                      %key-BookingId = |B{ lv_next WIDTH = 3 ALIGN = RIGHT PAD = '0' }| )
             TO mapped-booking.
    ENDLOOP.
  ENDMETHOD.

  METHOD get_global_authorizations.
    result-%create = if_abap_behv=>auth-allowed.
    result-%update = if_abap_behv=>auth-allowed.
    result-%delete = if_abap_behv=>auth-allowed.
  ENDMETHOD.

ENDCLASS.
