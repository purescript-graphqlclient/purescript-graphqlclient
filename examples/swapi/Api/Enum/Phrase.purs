module Api.Enum.Phrase where

-- | original type - Phrase
data Phrase
  = BadFeeling
  | Droids
  | Faith
  | Father
  | Help
  | TheForce
  | Traitor
  | Trap
  | Try

fromToMap :: Array (String /\ Phrase)
fromToMap = ["BAD_FEELING" /\ BadFeeling, "DROIDS" /\ Droids, "FAITH" /\ Faith, "FATHER" /\ Father, "HELP" /\ Help, "THE_FORCE" /\ TheForce, "TRAITOR" /\ Traitor, "TRAP" /\ Trap, "TRY" /\ Try]

instance phraseGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Phrase where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Phrase" fromToMap
