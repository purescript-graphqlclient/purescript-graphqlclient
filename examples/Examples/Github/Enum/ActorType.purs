module Examples.Github.Enum.ActorType where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ActorType
data ActorType = User | Team

derive instance genericActorType :: Generic ActorType _

instance showActorType :: Show ActorType where
  show = genericShow

derive instance eqActorType :: Eq ActorType

derive instance ordActorType :: Ord ActorType

fromToMap :: Array (Tuple String ActorType)
fromToMap = [ Tuple "USER" User, Tuple "TEAM" Team ]

instance actorTypeGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder ActorType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ActorType" fromToMap

instance actorTypeToGraphQLArgumentValue
  :: ToGraphQLArgumentValue ActorType where
  toGraphQLArgumentValue =
    case _ of
      User -> ArgumentValueEnum "USER"
      Team -> ArgumentValueEnum "TEAM"
