module Api.Enum.Language where

-- | original type - Language
data Language
  = En
  | Es
  | No

fromToMap :: Array (String /\ Language)
fromToMap = ["EN" /\ En, "ES" /\ Es, "NO" /\ No]

instance languageGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Language where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Language" fromToMap
