@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking projection view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_BOOKING_T43
    provider contract transactional_query
    as projection on zi_booking_t43
{
    key BookingId,
    CustomerId,
    BookingDate,
    Description,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    OverallStatus,
//    CreatedBy,
//    CreatedAt,
//    LastChangedBy,
//    LastChangedAt,
//    LocalLastChangedAt,
    /* Associations */
    _bokingItem,
    _customer
}
