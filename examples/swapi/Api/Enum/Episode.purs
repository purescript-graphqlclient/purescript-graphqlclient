module Api.Enum.Episode where

-- | original type - Episode
data Episode
  = Empire
  | Jedi
  | Newhope

fromToMap :: Array (String /\ Episode)
fromToMap = ["EMPIRE" /\ Empire, "JEDI" /\ Jedi, "NEWHOPE" /\ Newhope]

instance episodeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Episode where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Episode" fromToMap
