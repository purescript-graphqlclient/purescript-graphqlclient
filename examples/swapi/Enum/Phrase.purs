module Swapi.Enum.Phrase where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - Phrase
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

fromToMap :: Array (Tuple String Phrase)
fromToMap = [Tuple "BAD_FEELING" BadFeeling, Tuple "DROIDS" Droids, Tuple "FAITH" Faith, Tuple "FATHER" Father, Tuple "HELP" Help, Tuple "THE_FORCE" TheForce, Tuple "TRAITOR" Traitor, Tuple "TRAP" Trap, Tuple "TRY" Try]

instance phraseGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Phrase where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Phrase" fromToMap

instance phraseToGraphqlArgumentValue :: ToGraphqlArgumentValue Phrase where
  toGraphqlArgumentValue =
    case _ of
      BadFeeling -> ArgumentValueString "BAD_FEELING"
      Droids -> ArgumentValueString "DROIDS"
      Faith -> ArgumentValueString "FAITH"
      Father -> ArgumentValueString "FATHER"
      Help -> ArgumentValueString "HELP"
      TheForce -> ArgumentValueString "THE_FORCE"
      Traitor -> ArgumentValueString "TRAITOR"
      Trap -> ArgumentValueString "TRAP"
      Try -> ArgumentValueString "TRY"
