module Api.Enum.PersonOrderBy where

-- | original type - PersonOrderBy
data PersonOrderBy
  = BirthYearAsc
  | BirthYearDesc
  | CreatedAtAsc
  | CreatedAtDesc
  | GenderAsc
  | GenderDesc
  | HeightAsc
  | HeightDesc
  | IdAsc
  | IdDesc
  | IsPublishedAsc
  | IsPublishedDesc
  | MassAsc
  | MassDesc
  | NameAsc
  | NameDesc
  | UpdatedAtAsc
  | UpdatedAtDesc

fromToMap :: Array (String /\ PersonOrderBy)
fromToMap = ["birthYear_ASC" /\ BirthYearAsc, "birthYear_DESC" /\ BirthYearDesc, "createdAt_ASC" /\ CreatedAtAsc, "createdAt_DESC" /\ CreatedAtDesc, "gender_ASC" /\ GenderAsc, "gender_DESC" /\ GenderDesc, "height_ASC" /\ HeightAsc, "height_DESC" /\ HeightDesc, "id_ASC" /\ IdAsc, "id_DESC" /\ IdDesc, "isPublished_ASC" /\ IsPublishedAsc, "isPublished_DESC" /\ IsPublishedDesc, "mass_ASC" /\ MassAsc, "mass_DESC" /\ MassDesc, "name_ASC" /\ NameAsc, "name_DESC" /\ NameDesc, "updatedAt_ASC" /\ UpdatedAtAsc, "updatedAt_DESC" /\ UpdatedAtDesc]

instance personOrderByGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PersonOrderBy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PersonOrderBy" fromToMap
