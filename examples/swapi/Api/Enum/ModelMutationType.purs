module Api.Enum.ModelMutationType where

-- | original type - _ModelMutationType
data ModelMutationType
  = Created
  | Updated
  | Deleted

fromToMap :: Array (String /\ ModelMutationType)
fromToMap = ["CREATED" /\ Created, "UPDATED" /\ Updated, "DELETED" /\ Deleted]

instance modelMutationTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ModelMutationType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ModelMutationType" fromToMap
