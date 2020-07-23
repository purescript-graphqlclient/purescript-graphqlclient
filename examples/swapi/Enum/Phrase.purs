module Examples.Swapi.Enum.Phrase where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      BadFeeling -> ArgumentValueEnum "BAD_FEELING"
      Droids -> ArgumentValueEnum "DROIDS"
      Faith -> ArgumentValueEnum "FAITH"
      Father -> ArgumentValueEnum "FATHER"
      Help -> ArgumentValueEnum "HELP"
      TheForce -> ArgumentValueEnum "THE_FORCE"
      Traitor -> ArgumentValueEnum "TRAITOR"
      Trap -> ArgumentValueEnum "TRAP"
      Try -> ArgumentValueEnum "TRY"
