@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CUSTOMER_TNV43 as select from zcustomer_tnv43
{
    key customer_id as CustomerId,
    customer_name as CustomerName,
    email as Email,
    city as City
}
