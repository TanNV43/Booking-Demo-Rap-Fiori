@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
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
    _bookingItem: redirected to composition child ZC_BKITEM_TNV43,
    _customer
}
