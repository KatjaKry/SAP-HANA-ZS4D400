@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.dataCategory: #VALUE_HELP
@EndUserText.label: 'Value Help Postcode'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity ZV_CS05_COUNTRY as select from zcs05_country
{
    @Search.defaultSearchElement: true
    key country as LandCode,
    
//    @Search.defaultSearchElement: true
        countryname as LandName
       
      
}
