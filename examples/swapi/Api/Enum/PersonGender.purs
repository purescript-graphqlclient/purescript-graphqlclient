module Api.Enum.PersonGender where

-- | original type - PERSON_GENDER
data PersonGender
  = Unknown
  | Male
  | Female
  | Hermaphrodite

fromToMap :: Array (String /\ PersonGender)
fromToMap = ["UNKNOWN" /\ Unknown, "MALE" /\ Male, "FEMALE" /\ Female, "HERMAPHRODITE" /\ Hermaphrodite]

instance personGenderGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PersonGender where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PersonGender" fromToMap
