module Api.Enum.PersonEyeColor where

-- | original type - PERSON_EYE_COLOR
data PersonEyeColor
  = Unknown
  | Blue
  | Yellow
  | Red
  | Brown
  | Bluegrey
  | Black
  | Orange
  | Hazel
  | Pink
  | Gold
  | Green
  | White
  | Dark

fromToMap :: Array (String /\ PersonEyeColor)
fromToMap = ["UNKNOWN" /\ Unknown, "BLUE" /\ Blue, "YELLOW" /\ Yellow, "RED" /\ Red, "BROWN" /\ Brown, "BLUEGREY" /\ Bluegrey, "BLACK" /\ Black, "ORANGE" /\ Orange, "HAZEL" /\ Hazel, "PINK" /\ Pink, "GOLD" /\ Gold, "GREEN" /\ Green, "WHITE" /\ White, "DARK" /\ Dark]

instance personEyeColorGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PersonEyeColor where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PersonEyeColor" fromToMap
