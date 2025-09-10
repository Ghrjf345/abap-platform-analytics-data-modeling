@ObjectModel: {
  supportedCapabilities: [ #ANALYTICAL_PARENT_CHILD_HIERARCHY_NODE ],
  modelingPattern: #ANALYTICAL_PARENT_CHILD_HIERARCHY_NODE
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Hierarchy'
define hierarchy ZANA_I_CarrierHier
  with parameters
    p_HierarchyID : Zana_carrier_hieid,
    p_DateFrom    : Zana_date_from,
    p_Dateto      : Zana_date_to
  as parent child hierarchy(
    source ZANA_P_CarrierHierBase
    child to parent association _Parent
    period from DateFrom to DateTo valid from $parameters.p_DateFrom to $parameters.p_Dateto
    directory _Dir filter by
      HierarchyID = $parameters.p_HierarchyID
    start where
      ParentNodeID is initial
    siblings order by
      SequenceNumber
    nodetype NodeType
  )

{
  key HierarchyID,
  key NodeID,
  key DateTo,
      DateFrom,
      ParentNodeID,
      AirlineID,
      NodeName,
      NodeType,

      _Dir,
      _Parent,
      _Carrier,
      _Node
}
