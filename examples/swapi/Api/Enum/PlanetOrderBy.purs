module Api.Enum.PlanetOrderBy where

-- | original type - PlanetOrderBy
data PlanetOrderBy
  = CreatedAtAsc
  | CreatedAtDesc
  | DiameterAsc
  | DiameterDesc
  | GravityAsc
  | GravityDesc
  | IdAsc
  | IdDesc
  | IsPublishedAsc
  | IsPublishedDesc
  | NameAsc
  | NameDesc
  | OrbitalPeriodAsc
  | OrbitalPeriodDesc
  | PopulationAsc
  | PopulationDesc
  | RotationPeriodAsc
  | RotationPeriodDesc
  | SurfaceWaterAsc
  | SurfaceWaterDesc
  | UpdatedAtAsc
  | UpdatedAtDesc

fromToMap :: Array (String /\ PlanetOrderBy)
fromToMap = ["createdAt_ASC" /\ CreatedAtAsc, "createdAt_DESC" /\ CreatedAtDesc, "diameter_ASC" /\ DiameterAsc, "diameter_DESC" /\ DiameterDesc, "gravity_ASC" /\ GravityAsc, "gravity_DESC" /\ GravityDesc, "id_ASC" /\ IdAsc, "id_DESC" /\ IdDesc, "isPublished_ASC" /\ IsPublishedAsc, "isPublished_DESC" /\ IsPublishedDesc, "name_ASC" /\ NameAsc, "name_DESC" /\ NameDesc, "orbitalPeriod_ASC" /\ OrbitalPeriodAsc, "orbitalPeriod_DESC" /\ OrbitalPeriodDesc, "population_ASC" /\ PopulationAsc, "population_DESC" /\ PopulationDesc, "rotationPeriod_ASC" /\ RotationPeriodAsc, "rotationPeriod_DESC" /\ RotationPeriodDesc, "surfaceWater_ASC" /\ SurfaceWaterAsc, "surfaceWater_DESC" /\ SurfaceWaterDesc, "updatedAt_ASC" /\ UpdatedAtAsc, "updatedAt_DESC" /\ UpdatedAtDesc]

instance planetOrderByGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PlanetOrderBy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PlanetOrderBy" fromToMap
