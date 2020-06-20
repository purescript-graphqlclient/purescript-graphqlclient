module Api.Enum.SpeciesOrderBy where

-- | original type - SpeciesOrderBy
data SpeciesOrderBy
  = AverageHeightAsc
  | AverageHeightDesc
  | AverageLifespanAsc
  | AverageLifespanDesc
  | ClassificationAsc
  | ClassificationDesc
  | CreatedAtAsc
  | CreatedAtDesc
  | DesignationAsc
  | DesignationDesc
  | IdAsc
  | IdDesc
  | IsPublishedAsc
  | IsPublishedDesc
  | LanguageAsc
  | LanguageDesc
  | NameAsc
  | NameDesc
  | UpdatedAtAsc
  | UpdatedAtDesc

fromToMap :: Array (String /\ SpeciesOrderBy)
fromToMap = ["averageHeight_ASC" /\ AverageHeightAsc, "averageHeight_DESC" /\ AverageHeightDesc, "averageLifespan_ASC" /\ AverageLifespanAsc, "averageLifespan_DESC" /\ AverageLifespanDesc, "classification_ASC" /\ ClassificationAsc, "classification_DESC" /\ ClassificationDesc, "createdAt_ASC" /\ CreatedAtAsc, "createdAt_DESC" /\ CreatedAtDesc, "designation_ASC" /\ DesignationAsc, "designation_DESC" /\ DesignationDesc, "id_ASC" /\ IdAsc, "id_DESC" /\ IdDesc, "isPublished_ASC" /\ IsPublishedAsc, "isPublished_DESC" /\ IsPublishedDesc, "language_ASC" /\ LanguageAsc, "language_DESC" /\ LanguageDesc, "name_ASC" /\ NameAsc, "name_DESC" /\ NameDesc, "updatedAt_ASC" /\ UpdatedAtAsc, "updatedAt_DESC" /\ UpdatedAtDesc]

instance speciesOrderByGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SpeciesOrderBy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SpeciesOrderBy" fromToMap
