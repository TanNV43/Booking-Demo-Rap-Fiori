@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_booking_t43      as select from zbooking_t43
    composition [0..*] of zi_bkitem_tnv43   as _bookingItem
    association [0..1] to ZI_CUSTOMER_TNV43 as _customer on $projection.CustomerId = _customer.CustomerId
{
    key booking_id as BookingId,
    customer_id as CustomerId,
    booking_date as BookingDate,
    description as Description,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    overall_status as OverallStatus,
    case overall_status
        when 'N' then 2        -- New       -> yellow (needs attention)
        when 'A' then 3        -- Accepted  -> green
        when 'X' then 1        -- Cancelled -> red
        else 0
    end as StatusCriticality,
        
//    confirm_flag          as ConfirmFlag,
//    priority              as Priority,
//    customer_rating       as CustomerRating,
//    completion_pct        as CompletionPct,
    
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    local_last_changed_at as LocalLastChangedAt,
    _bookingItem,
    _customer // Make association public
}
