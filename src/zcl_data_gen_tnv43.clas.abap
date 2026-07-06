CLASS zcl_data_gen_tnv43 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_gen_tnv43 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM zbkitem_tnv43.
    DELETE FROM zbooking_t43.
    DELETE FROM zcustomer_tnv43.

*--------------------------------------------------------------------
* Customer
*--------------------------------------------------------------------
    DATA: lt_customer TYPE TABLE OF zcustomer_tnv43.

    lt_customer = VALUE #(

    (
    customer_id = 'C001'
    customer_name = 'John Smith'
    email = 'john.smith@gmail.com'
    city = 'New York'
    )

    (
    customer_id = 'C002'
    customer_name = 'Mary Johnson'
    email = 'mary.johnson@yahoo.com'
    city = 'Chicago'
    )

    (
    customer_id = 'C003'
    customer_name = 'David Brown'
    email = 'david.brown@outlook.com'
    city = 'Los Angeles'
    )

   ).

    INSERT zcustomer_tnv43 FROM TABLE @lt_customer.

*--------------------------------------------------------------------
* Booking Header
*--------------------------------------------------------------------
    DATA: lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.

    DATA: lt_booking TYPE TABLE OF zbooking_t43.

    lt_booking = VALUE #(

    ( booking_id = 'B001'
    customer_id = 'C001'
    booking_date = sy-datum
    description = 'Office supplies'
    total_price = '120.00'
    currency_code = 'USD'
    overall_status = 'N'
    created_by = sy-uname
    created_at = lv_timestamp
    last_changed_by = sy-uname
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp )

    ( booking_id = 'B002'
    customer_id = 'C001'
    booking_date = sy-datum
    description = 'IT Equipment'
    total_price = '350.00'
    currency_code = 'USD'
    overall_status = 'A'
    created_by = sy-uname
    created_at = lv_timestamp
    last_changed_by = sy-uname
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp )

    ( booking_id = 'B003'
    customer_id = 'C002'
    booking_date = sy-datum
    description = 'Stationery'
    total_price = '500.00'
    currency_code = 'USD'
    overall_status = 'N'
    created_by = sy-uname
    created_at = lv_timestamp
    last_changed_by = sy-uname
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp )

    ( booking_id = 'B004'
    customer_id = 'C003'
    booking_date = sy-datum
    description = 'Laptop Purchase'
    total_price = '800.00'
    currency_code = 'USD'
    overall_status = 'A'
    created_by = sy-uname
    created_at = lv_timestamp
    last_changed_by = sy-uname
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp )

    ( booking_id = 'B005'
    customer_id = 'C003'
    booking_date = sy-datum
    description = 'Project Material'
    total_price = '650.00'
    currency_code = 'USD'
    overall_status = 'N'
    created_by = sy-uname
    created_at = lv_timestamp
    last_changed_by = sy-uname
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp )

    ).

    INSERT zbooking_t43 FROM TABLE @lt_booking.

*--------------------------------------------------------------------
* Booking Item
*--------------------------------------------------------------------
    DATA: lt_item TYPE TABLE OF zbkitem_tnv43.

    lt_item = VALUE #(

* B001 -> 1 item
    (
    booking_id = 'B001'
    item_id = '000001'
    product_id = 'P100'
    quantity = 2
    quantity_unit = 'EA'
    item_price = '120.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

* B002 -> 1 item
    (
    booking_id = 'B002'
    item_id = '000001'
    product_id = 'P200'
    quantity = 1
    quantity_unit = 'EA'
    item_price = '350.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

* B003 -> 3 items
    (
    booking_id = 'B003'
    item_id = '000001'
    product_id = 'P300'
    quantity = 5
    quantity_unit = 'EA'
    item_price = '100.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

    (
    booking_id = 'B003'
    item_id = '000002'
    product_id = 'P301'
    quantity = 3
    quantity_unit = 'EA'
    item_price = '150.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

    (
    booking_id = 'B003'
    item_id = '000003'
    product_id = 'P302'
    quantity = 2
    quantity_unit = 'EA'
    item_price = '250.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

* B004 -> 2 items
    (
    booking_id = 'B004'
    item_id = '000001'
    product_id = 'P400'
    quantity = 1
    quantity_unit = 'EA'
    item_price = '500.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

    (
    booking_id = 'B004'
    item_id = '000002'
    product_id = 'P401'
    quantity = 1
    quantity_unit = 'EA'
    item_price = '300.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

* B005 -> 3 items
    (
    booking_id = 'B005'
    item_id = '000001'
    product_id = 'P500'
    quantity = 2
    quantity_unit = 'EA'
    item_price = '200.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

    (
    booking_id = 'B005'
    item_id = '000002'
    product_id = 'P501'
    quantity = 2
    quantity_unit = 'EA'
    item_price = '200.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

    (
    booking_id = 'B005'
    item_id = '000003'
    product_id = 'P502'
    quantity = 1
    quantity_unit = 'EA'
    item_price = '250.00'
    currency_code = 'USD'
    last_changed_at = lv_timestamp
    local_last_changed_at = lv_timestamp
    )

    ).

    INSERT zbkitem_tnv43 FROM TABLE @lt_item.

    COMMIT WORK.

    out->write( |Customers: 3| ).
    out->write( |Bookings : 5| ).
    out->write( |Booking Items : 10| ).
  ENDMETHOD.
ENDCLASS.
