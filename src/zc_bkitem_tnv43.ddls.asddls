@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking item projection view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BKITEM_TNV43 
    provider contract transactional_query
    as projection on zi_bkitem_tnv43
{
    key BookingId,
    key ItemId,
    ProductId,
    @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
    Quantity,
    QuantityUnit,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    ItemPrice,
    CurrencyCode,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _bookingHeader
}
