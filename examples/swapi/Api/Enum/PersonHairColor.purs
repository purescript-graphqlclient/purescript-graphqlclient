module Api.Enum.PersonHairColor where

-- | original type - PERSON_HAIR_COLOR
data PersonHairColor
  = Auburn
  | Black
  | Blonde
  | Brown
  | Grey
  | Unknown
  | White

fromToMap :: Array (String /\ PersonHairColor)
fromToMap = ["AUBURN" /\ Auburn, "BLACK" /\ Black, "BLONDE" /\ Blonde, "BROWN" /\ Brown, "GREY" /\ Grey, "UNKNOWN" /\ Unknown, "WHITE" /\ White]

instance personHairColorGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PersonHairColor where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PersonHairColor" fromToMap
