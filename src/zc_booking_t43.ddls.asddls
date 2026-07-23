@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['BookingId']
@Search.searchable: true
define root view entity ZC_BOOKING_T43
    provider contract transactional_query
    as projection on zi_booking_t43
{
    key BookingId,
    @ObjectModel.text.element: ['CustomerName']
    CustomerId,
    
    BookingDate,
    Description,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    
    @ObjectModel.text.element: ['StatusText']
    @Consumption.valueHelpDefinition: [{ entity: { name:            'ZI_BOOKING_STATUS_TNV43',
                                                   element:         'OverallStatus' },
                                                   useForValidation: true }]
    OverallStatus,
    ConfirmFlag,
    Priority,

    CustomerRating,
    CompletionPct,
    
    StatusCriticality,
    PriorityCriticality,
    
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_BOOKING_CRIT_VE_TNV43'
//    virtual VEStatusCriticality : abap.char( 1 ),
//    CreatedBy,
//    CreatedAt,
//    LastChangedBy,
//    LastChangedAt,
//    LocalLastChangedAt,
    /* Associations */
    
    _customer.CustomerName as CustomerName,
    _customer.Email        as CustomerEmail,
    _customer.City         as CustomerCity,
    
    _status.StatusText     as StatusText,
    
    _bookingItem: redirected to composition child ZC_BKITEM_TNV43,
    _customer,
    _status 
}
