module Api.Enum.StarshipOrderBy where

-- | original type - StarshipOrderBy
data StarshipOrderBy
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
  | HyperdriveRatingAsc
  | HyperdriveRatingDesc
  | IdAsc
  | IdDesc
  | IsPublishedAsc
  | IsPublishedDesc
  | LengthAsc
  | LengthDesc
  | MaxAtmospheringSpeedAsc
  | MaxAtmospheringSpeedDesc
  | MgltAsc
  | MgltDesc
  | NameAsc
  | NameDesc
  | PassengersAsc
  | PassengersDesc
  | UpdatedAtAsc
  | UpdatedAtDesc

fromToMap :: Array (String /\ StarshipOrderBy)
fromToMap = ["cargoCapacity_ASC" /\ CargoCapacityAsc, "cargoCapacity_DESC" /\ CargoCapacityDesc, "class_ASC" /\ ClassAsc, "class_DESC" /\ ClassDesc, "consumables_ASC" /\ ConsumablesAsc, "consumables_DESC" /\ ConsumablesDesc, "costInCredits_ASC" /\ CostInCreditsAsc, "costInCredits_DESC" /\ CostInCreditsDesc, "createdAt_ASC" /\ CreatedAtAsc, "createdAt_DESC" /\ CreatedAtDesc, "crew_ASC" /\ CrewAsc, "crew_DESC" /\ CrewDesc, "hyperdriveRating_ASC" /\ HyperdriveRatingAsc, "hyperdriveRating_DESC" /\ HyperdriveRatingDesc, "id_ASC" /\ IdAsc, "id_DESC" /\ IdDesc, "isPublished_ASC" /\ IsPublishedAsc, "isPublished_DESC" /\ IsPublishedDesc, "length_ASC" /\ LengthAsc, "length_DESC" /\ LengthDesc, "maxAtmospheringSpeed_ASC" /\ MaxAtmospheringSpeedAsc, "maxAtmospheringSpeed_DESC" /\ MaxAtmospheringSpeedDesc, "mglt_ASC" /\ MgltAsc, "mglt_DESC" /\ MgltDesc, "name_ASC" /\ NameAsc, "name_DESC" /\ NameDesc, "passengers_ASC" /\ PassengersAsc, "passengers_DESC" /\ PassengersDesc, "updatedAt_ASC" /\ UpdatedAtAsc, "updatedAt_DESC" /\ UpdatedAtDesc]

instance starshipOrderByGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder StarshipOrderBy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "StarshipOrderBy" fromToMap
