module Api.Enum.VehicleOrderBy where

-- | original type - VehicleOrderBy
data VehicleOrderBy
  = CargoCapacityAsc
  | CargoCapacityDesc
  | ClassAsc
  | ClassDesc
  | ConsumablesAsc
  | ConsumablesDesc
  | CostInCreditsAsc
  | CostInCreditsDesc
  | CreatedAtAsc
  | CreatedAtDesc
  | CrewAsc
  | CrewDesc
  | IdAsc
  | IdDesc
  | IsPublishedAsc
  | IsPublishedDesc
  | LengthAsc
  | LengthDesc
  | MaxAtmospheringSpeedAsc
  | MaxAtmospheringSpeedDesc
  | ModelAsc
  | ModelDesc
  | NameAsc
  | NameDesc
  | PassengersAsc
  | PassengersDesc
  | UpdatedAtAsc
  | UpdatedAtDesc

fromToMap :: Array (String /\ VehicleOrderBy)
fromToMap = ["cargoCapacity_ASC" /\ CargoCapacityAsc, "cargoCapacity_DESC" /\ CargoCapacityDesc, "class_ASC" /\ ClassAsc, "class_DESC" /\ ClassDesc, "consumables_ASC" /\ ConsumablesAsc, "consumables_DESC" /\ ConsumablesDesc, "costInCredits_ASC" /\ CostInCreditsAsc, "costInCredits_DESC" /\ CostInCreditsDesc, "createdAt_ASC" /\ CreatedAtAsc, "createdAt_DESC" /\ CreatedAtDesc, "crew_ASC" /\ CrewAsc, "crew_DESC" /\ CrewDesc, "id_ASC" /\ IdAsc, "id_DESC" /\ IdDesc, "isPublished_ASC" /\ IsPublishedAsc, "isPublished_DESC" /\ IsPublishedDesc, "length_ASC" /\ LengthAsc, "length_DESC" /\ LengthDesc, "maxAtmospheringSpeed_ASC" /\ MaxAtmospheringSpeedAsc, "maxAtmospheringSpeed_DESC" /\ MaxAtmospheringSpeedDesc, "model_ASC" /\ ModelAsc, "model_DESC" /\ ModelDesc, "name_ASC" /\ NameAsc, "name_DESC" /\ NameDesc, "passengers_ASC" /\ PassengersAsc, "passengers_DESC" /\ PassengersDesc, "updatedAt_ASC" /\ UpdatedAtAsc, "updatedAt_DESC" /\ UpdatedAtDesc]

instance vehicleOrderByGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder VehicleOrderBy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "VehicleOrderBy" fromToMap
