CLASS zcl_booking_crit_ve_tnv43 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_booking_crit_ve_tnv43 IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA lt_booking TYPE STANDARD TABLE OF zc_booking_T43.
    lt_booking = CORRESPONDING #( it_original_data ).

    LOOP AT lt_booking ASSIGNING FIELD-SYMBOL(<b>).
        <b>-VEStatusCriticality = SWITCH #( <b>-OverallStatus
                                          WHEN 'N' THEN 2
                                          WHEN 'A' THEN 3
                                          WHEN 'X' THEN 1
                                          ELSE 0 ).
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_booking ).
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    APPEND 'OVERALLSTATUS' TO et_requested_orig_elements.
  ENDMETHOD.
ENDCLASS.
