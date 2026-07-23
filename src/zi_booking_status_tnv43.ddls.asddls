@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_BOOKING_STATUS_TNV43 as select from zstatus_tnv43
{
  key status  as OverallStatus,
  @Semantics.text: true
  status_text as StatusText
}
