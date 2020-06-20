module Api.Enum.PersonSkinColor where

-- | original type - PERSON_SKIN_COLOR
data PersonSkinColor
  = Unknown
  | Fair
  | Gold
  | White
  | Light
  | Green
  | Greentan
  | Pale
  | Metal
  | Dark
  | Brownmottle
  | Brown
  | Grey
  | Mottledgreen
  | Orange
  | Blue
  | Red
  | Yellow
  | Tan
  | Silver

fromToMap :: Array (String /\ PersonSkinColor)
fromToMap = ["UNKNOWN" /\ Unknown, "FAIR" /\ Fair, "GOLD" /\ Gold, "WHITE" /\ White, "LIGHT" /\ Light, "GREEN" /\ Green, "GREENTAN" /\ Greentan, "PALE" /\ Pale, "METAL" /\ Metal, "DARK" /\ Dark, "BROWNMOTTLE" /\ Brownmottle, "BROWN" /\ Brown, "GREY" /\ Grey, "MOTTLEDGREEN" /\ Mottledgreen, "ORANGE" /\ Orange, "BLUE" /\ Blue, "RED" /\ Red, "YELLOW" /\ Yellow, "TAN" /\ Tan, "SILVER" /\ Silver]

instance personSkinColorGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PersonSkinColor where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PersonSkinColor" fromToMap
