module Api.Enum.SpeciesEyeColor where

-- | original type - SPECIES_EYE_COLOR
data SpeciesEyeColor
  = Amber
  | Black
  | Blue
  | Brown
  | Gold
  | Green
  | Grey
  | Hazel
  | Indigo
  | Orange
  | Pink
  | Red
  | Silver
  | Unknown
  | Yellow
  | Golden

fromToMap :: Array (String /\ SpeciesEyeColor)
fromToMap = ["AMBER" /\ Amber, "BLACK" /\ Black, "BLUE" /\ Blue, "BROWN" /\ Brown, "GOLD" /\ Gold, "GREEN" /\ Green, "GREY" /\ Grey, "HAZEL" /\ Hazel, "INDIGO" /\ Indigo, "ORANGE" /\ Orange, "PINK" /\ Pink, "RED" /\ Red, "SILVER" /\ Silver, "UNKNOWN" /\ Unknown, "YELLOW" /\ Yellow, "GOLDEN" /\ Golden]

instance speciesEyeColorGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SpeciesEyeColor where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SpeciesEyeColor" fromToMap
