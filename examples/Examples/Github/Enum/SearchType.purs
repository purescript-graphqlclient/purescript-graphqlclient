module Examples.Github.Enum.SearchType where

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

-- | original name - SearchType
data SearchType = Issue | Repository | User | Discussion

derive instance genericSearchType :: Generic SearchType _

instance showSearchType :: Show SearchType where
  show = genericShow

derive instance eqSearchType :: Eq SearchType

derive instance ordSearchType :: Ord SearchType

fromToMap :: Array (Tuple String SearchType)
fromToMap = [ Tuple "ISSUE" Issue
            , Tuple "REPOSITORY" Repository
            , Tuple "USER" User
            , Tuple "DISCUSSION" Discussion
            ]

instance searchTypeGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SearchType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SearchType" fromToMap

instance searchTypeToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SearchType where
  toGraphQLArgumentValue =
    case _ of
      Issue -> ArgumentValueEnum "ISSUE"
      Repository -> ArgumentValueEnum "REPOSITORY"
      User -> ArgumentValueEnum "USER"
      Discussion -> ArgumentValueEnum "DISCUSSION"
