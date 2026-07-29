@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Confirm Flag Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_CONFIRM_VH_TNV43
  as select from zconfirm_tnv43 
{
  @ObjectModel.text.element: ['ConfirmFlagText']
  key confirm_flag  as ConfirmFlag,

  @Semantics.text: true
  confirm_text      as ConfirmFlagText
}
