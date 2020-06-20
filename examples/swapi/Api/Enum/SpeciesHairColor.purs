module Api.Enum.SpeciesHairColor where

-- | original type - SPECIES_HAIR_COLOR
data SpeciesHairColor
  = Unknown
  | Brown
  | White
  | Red
  | Black
  | Blonde

fromToMap :: Array (String /\ SpeciesHairColor)
fromToMap = ["UNKNOWN" /\ Unknown, "BROWN" /\ Brown, "WHITE" /\ White, "RED" /\ Red, "BLACK" /\ Black, "BLONDE" /\ Blonde]

instance speciesHairColorGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SpeciesHairColor where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SpeciesHairColor" fromToMap
