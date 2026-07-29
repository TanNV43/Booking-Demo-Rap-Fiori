@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Priority Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
@UI.presentationVariant: [{
    sortOrder: [{ by: 'Priority', direction: #ASC }]
}]
define view entity ZI_PRIORITY_VH_TNV43 as select from zpriority_tnv43
{
  @ObjectModel.text.element: ['PriorityText']
  @UI.textArrangement: #TEXT_ONLY
  key priority      as Priority,

  @Semantics.text: true
  priority_text     as PriorityText
}
