@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airport Hierarchy Nodes'
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'Nodename'
@ObjectModel: {
  supportedCapabilities: [ #ANALYTICAL_DIMENSION ],
  modelingPattern: #ANALYTICAL_DIMENSION
}
define view entity ZANA_I_AirportHierNode as select from Zana_ap_hn
  association to ZANA_I_AirportHierDir as _Dir on _Dir.HierarchyID = $projection.HierarchyID
{
       @ObjectModel.foreignKey.association: '_Dir'
   key hierarchy_id  as HierarchyID,
       @ObjectModel.text.element: [ 'NodeText' ]
   key nodename as NodeName,
       @Semantics.text: true
       nodetext as NodeText,
       
   _Dir
}
