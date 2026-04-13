@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.dataCategory: #VALUE_HELP
@EndUserText.label: 'Value Help Postcode'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity ZV_CS05_POSTCODE as select from zcs05_postcode
{
    @Search.defaultSearchElement: true
    key postcode as plz,
    
//    @Search.defaultSearchElement: true
        city as stadt,
       
// @Search.defaultSearchElement: true
        country as Land
       
}
