@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Directory for Carrier Hierarchies'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'HierarchyID'
@ObjectModel: {
  supportedCapabilities: [ #ANALYTICAL_DIMENSION ],
  modelingPattern: #ANALYTICAL_DIMENSION
}
define view entity ZANA_I_CARRIERHIERDIR
  as select from Zana_cr_s_hd
{
      @ObjectModel.text.element: [ 'Name' ]
  key hierarchy_id    as HierarchyID,
      @Semantics.text: true
      name            as Name,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt
}
