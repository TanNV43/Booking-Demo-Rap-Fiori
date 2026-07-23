CLASS zcl_data_gen_tnv43 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      clear_all_tables IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      fill_status      IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      fill_customer    IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      fill_booking     IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      fill_booking_item IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.



CLASS zcl_data_gen_tnv43 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( |=== START GENERATE DATA ===| ).

    clear_all_tables( out ).
    fill_status(       out ).
    fill_customer(     out ).
    fill_booking(      out ).
    fill_booking_item( out ).

    out->write( |=== DONE ===| ).
  ENDMETHOD.


  METHOD clear_all_tables.
    DELETE FROM zbkitem_tnv43.
    DELETE FROM zbooking_t43.
    DELETE FROM zcustomer_tnv43.
    DELETE FROM zstatus_tnv43.

    COMMIT WORK.
    out->write( |Cleared all tables.| ).
  ENDMETHOD.


  METHOD fill_status.
    DATA lt_status TYPE TABLE OF zstatus_tnv43.

    lt_status = VALUE #(
      ( status = 'N' status_text = 'New' )
      ( status = 'A' status_text = 'Accepted' )
      ( status = 'X' status_text = 'Cancelled' )
    ).

    INSERT zstatus_tnv43 FROM TABLE @lt_status.
    COMMIT WORK.

    out->write( |Inserted { sy-dbcnt } status records.| ).
  ENDMETHOD.


  METHOD fill_customer.
    DATA lt_customer TYPE TABLE OF zcustomer_tnv43.

    lt_customer = VALUE #(
      ( customer_id = 'C001' customer_name = 'John Smith'    email = 'john@example.com'    city = 'New York'    )
      ( customer_id = 'C002' customer_name = 'Mary Johnson'  email = 'mary@example.com'    city = 'Los Angeles' )
      ( customer_id = 'C003' customer_name = 'David Brown'   email = 'david@example.com'   city = 'Chicago'     )
      ( customer_id = 'C004' customer_name = 'Emma Wilson'   email = 'emma@example.com'    city = 'Houston'     )
      ( customer_id = 'C005' customer_name = 'Michael Davis' email = 'michael@example.com' city = 'Phoenix'     )
    ).

    INSERT zcustomer_tnv43 FROM TABLE @lt_customer.
    COMMIT WORK.

    out->write( |Inserted { sy-dbcnt } customer records.| ).
  ENDMETHOD.

  METHOD fill_booking.
    DATA lt_booking TYPE TABLE OF zbooking_t43.

    DATA(lv_now)   = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) ).
    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).

    lt_booking = VALUE #(
      ( client                = sy-mandt
        booking_id            = '0000000001'
        customer_id           = 'C001'
        booking_date          = lv_today
        description           = 'Flight booking - NYC to LAX'
        total_price           = '120.00'
        currency_code         = 'USD'
        overall_status        = 'N'
        confirm_flag          = ''
        priority              = '2'
        customer_rating       = '4.5'
        completion_pct        = 20
        created_by            = sy-uname
        created_at            = lv_now
        last_changed_by       = sy-uname
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000002'
        customer_id           = 'C001'
        booking_date          = lv_today
        description           = 'Hotel booking - Manhattan'
        total_price           = '350.00'
        currency_code         = 'USD'
        overall_status        = 'A'
        confirm_flag          = 'X'
        priority              = '1'
        customer_rating       = '5.0'
        completion_pct        = 100
        created_by            = sy-uname
        created_at            = lv_now
        last_changed_by       = sy-uname
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000003'
        customer_id           = 'C002'
        booking_date          = lv_today
        description           = 'Car rental - LA weekend'
        total_price           = '500.00'
        currency_code         = 'USD'
        overall_status        = 'N'
        confirm_flag          = ''
        priority              = '3'
        customer_rating       = '3.5'
        completion_pct        = 50
        created_by            = sy-uname
        created_at            = lv_now
        last_changed_by       = sy-uname
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000004'
        customer_id           = 'C003'
        booking_date          = lv_today
        description           = 'Business trip package'
        total_price           = '800.00'
        currency_code         = 'USD'
        overall_status        = 'A'
        confirm_flag          = 'X'
        priority              = '2'
        customer_rating       = '4.0'
        completion_pct        = 100
        created_by            = sy-uname
        created_at            = lv_now
        last_changed_by       = sy-uname
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000005'
        customer_id           = 'C003'
        booking_date          = lv_today
        description           = 'Vacation package - Hawaii'
        total_price           = '650.00'
        currency_code         = 'USD'
        overall_status        = 'N'
        confirm_flag          = ''
        priority              = '1'
        customer_rating       = '4.5'
        completion_pct        = 30
        created_by            = sy-uname
        created_at            = lv_now
        last_changed_by       = sy-uname
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      " ===== CANCELLED BOOKINGS =====
      ( client                = sy-mandt
        booking_id            = '0000000006'
        customer_id           = 'C002'
        booking_date          = lv_today
        description           = 'Cancelled - Customer changed plans'
        total_price           = '450.00'
        currency_code         = 'USD'
        overall_status        = 'X'
        confirm_flag          = ''
        priority              = '2'
        customer_rating       = '2.0'
        completion_pct        = 0
        created_by            = sy-uname
        created_at            = lv_now
        last_changed_by       = sy-uname
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000007'
        customer_id           = 'C004'
        booking_date          = lv_today
        description           = 'Cancelled - Payment failed'
        total_price           = '900.00'
        currency_code         = 'USD'
        overall_status        = 'X'
        confirm_flag          = ''
        priority              = '3'
        customer_rating       = '1.5'
        completion_pct        = 0
        created_by            = sy-uname
        created_at            = lv_now
        last_changed_by       = sy-uname
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000008'
        customer_id           = 'C005'
        booking_date          = lv_today
        description           = 'Cancelled - Weather issue'
        total_price           = '280.00'
        currency_code         = 'USD'
        overall_status        = 'X'
        confirm_flag          = ''
        priority              = '1'
        customer_rating       = '3.0'
        completion_pct        = 0
        created_by            = sy-uname
        created_at            = lv_now
        last_changed_by       = sy-uname
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )
    ).

    INSERT zbooking_t43 FROM TABLE @lt_booking.
    COMMIT WORK.

    out->write( |Inserted { sy-dbcnt } booking records.| ).
  ENDMETHOD.


  METHOD fill_booking_item.
    DATA lt_item TYPE TABLE OF zbkitem_tnv43.

    DATA(lv_now) = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) ).

    lt_item = VALUE #(
      " Items for Booking 0000000001
      ( client                = sy-mandt
        booking_id            = '0000000001'
        item_id               = '0001'
        product_id            = 'FLIGHT-001'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '100.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000001'
        item_id               = '0002'
        product_id            = 'MEAL-STD'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '20.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      " Items for Booking 0000000002
      ( client                = sy-mandt
        booking_id            = '0000000002'
        item_id               = '0001'
        product_id            = 'HOTEL-DLX'
        quantity              = '2.000'
        quantity_unit         = 'EA'
        item_price            = '150.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000002'
        item_id               = '0002'
        product_id            = 'BREAKFAST'
        quantity              = '2.000'
        quantity_unit         = 'EA'
        item_price            = '25.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      " Items for Booking 0000000003
      ( client                = sy-mandt
        booking_id            = '0000000003'
        item_id               = '0001'
        product_id            = 'CAR-SUV'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '400.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000003'
        item_id               = '0002'
        product_id            = 'INSURANCE'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '100.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      " Items for Booking 0000000004
      ( client                = sy-mandt
        booking_id            = '0000000004'
        item_id               = '0001'
        product_id            = 'FLIGHT-BIZ'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '500.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000004'
        item_id               = '0002'
        product_id            = 'HOTEL-EXE'
        quantity              = '2.000'
        quantity_unit         = 'EA'
        item_price            = '150.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      " Items for Booking 0000000005
      ( client                = sy-mandt
        booking_id            = '0000000005'
        item_id               = '0001'
        product_id            = 'HAWAII-PKG'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '500.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000005'
        item_id               = '0002'
        product_id            = 'SPA-DAY'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '150.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000006'
        item_id               = '0001'
        product_id            = 'FLIGHT-002'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '450.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000007'
        item_id               = '0001'
        product_id            = 'CRUISE-7D'
        quantity              = '2.000'
        quantity_unit         = 'EA'
        item_price            = '450.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )

      ( client                = sy-mandt
        booking_id            = '0000000008'
        item_id               = '0001'
        product_id            = 'TOUR-CITY'
        quantity              = '1.000'
        quantity_unit         = 'EA'
        item_price            = '280.00'
        currency_code         = 'USD'
        last_changed_at       = lv_now
        local_last_changed_at = lv_now )
    ).

    INSERT zbkitem_tnv43 FROM TABLE @lt_item.
    COMMIT WORK.

    out->write( |Inserted { sy-dbcnt } booking item records.| ).
  ENDMETHOD.

ENDCLASS.
