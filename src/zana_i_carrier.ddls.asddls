@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@EndUserText.label: 'Carrier'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'AirlineID'
@ObjectModel: {
  supportedCapabilities: [ #ANALYTICAL_DIMENSION ],
  modelingPattern: #ANALYTICAL_DIMENSION
}
@Consumption.valueHelpDefinition: [ { entity.name: 'ZI_Carrier_StdVH'  } ]
define view entity ZANA_I_Carrier
  as select from Zcarrier
  
  association [*] to ZANA_I_CarrierHier    as _hier_std on _hier_std.AirlineID = $projection.AirlineID
  association [*] to ZANA_I_CARRIERHIER_TD as _hier_dtd on _hier_dtd.AirlineID = $projection.AirlineID
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Name']
  key carrier_id       as AirlineID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Semantics.text: true
      name             as Name,

      currency_code    as CurrencyCode,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at  as LastChangedAt,

      @Semantics.systemDateTime.createdAt: true
      local_created_at as LocalCreatedAt,
      
      // Hierarchy Structure depends on time
      @ObjectModel.association.toHierarchy
      _hier_std,
      
      // Hierarchy directory depends on time
      @ObjectModel.association.toHierarchy
      _hier_dtd      
}
