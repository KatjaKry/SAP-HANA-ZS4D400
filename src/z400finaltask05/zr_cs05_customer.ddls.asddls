@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZCS05_CUSTOMER'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_CS05_CUSTOMER
  as select from ZCS05_CUSTOMER as CUSTOMER05
{
  key customerid as Customerid,
  salutation as Salutation,
  last_name as LastName,
  first_name as FirstName,
  street as Street,
  city as City,
  country as Country,
  postcode as Postcode,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
