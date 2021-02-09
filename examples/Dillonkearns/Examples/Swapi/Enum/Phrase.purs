module Dillonkearns.Examples.Swapi.Enum.Phrase where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
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

derive instance genericPhrase :: Generic Phrase _

instance showPhrase :: Show Phrase where
  show = genericShow

derive instance eqPhrase :: Eq Phrase

derive instance ordPhrase :: Ord Phrase

fromToMap :: Array (Tuple String Phrase)
fromToMap = [ Tuple "BAD_FEELING" BadFeeling
            , Tuple "DROIDS" Droids
            , Tuple "FAITH" Faith
            , Tuple "FATHER" Father
            , Tuple "HELP" Help
            , Tuple "THE_FORCE" TheForce
            , Tuple "TRAITOR" Traitor
            , Tuple "TRAP" Trap
            , Tuple "TRY" Try
            ]

instance phraseGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder Phrase where
  graphqlDefaultResponseScalarDecoder = enumDecoder "Phrase" fromToMap

instance phraseToGraphQLArgumentValue :: ToGraphQLArgumentValue Phrase where
  toGraphQLArgumentValue =
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
