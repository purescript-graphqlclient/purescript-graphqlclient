module Api.Enum.SpeciesSkinColor where

-- | original type - SPECIES_SKIN_COLOR
data SpeciesSkinColor
  = Blue
  | Brown
  | Caucasian
  | Dark
  | Green
  | Grey
  | Magenta
  | Orange
  | Pale
  | Palepink
  | Peach
  | Pink
  | Purple
  | Red
  | Tan
  | Unknown
  | White
  | Yellow
  | Black
  | Asian
  | Hispanic

fromToMap :: Array (String /\ SpeciesSkinColor)
fromToMap = ["BLUE" /\ Blue, "BROWN" /\ Brown, "CAUCASIAN" /\ Caucasian, "DARK" /\ Dark, "GREEN" /\ Green, "GREY" /\ Grey, "MAGENTA" /\ Magenta, "ORANGE" /\ Orange, "PALE" /\ Pale, "PALEPINK" /\ Palepink, "PEACH" /\ Peach, "PINK" /\ Pink, "PURPLE" /\ Purple, "RED" /\ Red, "TAN" /\ Tan, "UNKNOWN" /\ Unknown, "WHITE" /\ White, "YELLOW" /\ Yellow, "BLACK" /\ Black, "ASIAN" /\ Asian, "HISPANIC" /\ Hispanic]

instance speciesSkinColorGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SpeciesSkinColor where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SpeciesSkinColor" fromToMap
