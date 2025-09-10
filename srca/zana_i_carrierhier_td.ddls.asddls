@ObjectModel: {
  supportedCapabilities: [ #ANALYTICAL_PARENT_CHILD_HIERARCHY_NODE ],
  modelingPattern: #ANALYTICAL_PARENT_CHILD_HIERARCHY_NODE
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Hierarchy (tim-dep dir)'
define hierarchy ZANA_I_CARRIERHIER_TD
  with parameters
    p_HierarchyID : Zana_carrier_hieid,
    p_Keydate     : Zana_date_to
  as parent child hierarchy(
    source ZANA_P_CARRHIERRBASE_TD
    child to parent association _Parent
    directory _Dir filter by
          HierarchyID = $parameters.p_HierarchyID
      and DateTo      = $parameters.p_Keydate
    start where
      ParentNodeID is initial
    siblings order by
      SequenceNumber
    nodetype NodeType
  )

{
  key HierarchyID,
  key DateTo,
  key NodeID,
      ParentNodeID,
      AirlineID,
      NodeName,
      NodeType,

      _Dir,
      _Parent,
      _Carrier,
      _Node
}
