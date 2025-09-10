/*
The query shows how to add a specific value help to a parameter.
Reasons to use it would be if there is no standard value help available or if the standard value help is not specific enough.
*/
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Parameter with special value help'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [#ANALYTICAL_QUERY]
define transient view entity ZANA_C_PAR_Valuehelp
  provider contract analytical_query
  with parameters
    @Consumption.valueHelpDefinition: [
      { 
        entity : {
          name   : 'ZANA_C_PLANETYPE_VH',
          element: 'PlaneType'
        } 
      }
    ]
    P_PlaneType : Zplane_type_id
  as projection on ZANA_I_FlightCube
{
  @AnalyticsDetails.query.axis: #ROWS
  AirlineID,
  MaximumSeats
}
where
  PlaneType = $parameters.P_PlaneType
