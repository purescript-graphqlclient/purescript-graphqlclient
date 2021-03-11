module Examples.Github.Enum.RepositoryPrivacy where

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

-- | original name - RepositoryPrivacy
data RepositoryPrivacy = Public | Private

derive instance genericRepositoryPrivacy :: Generic RepositoryPrivacy _

instance showRepositoryPrivacy :: Show RepositoryPrivacy where
  show = genericShow

derive instance eqRepositoryPrivacy :: Eq RepositoryPrivacy

derive instance ordRepositoryPrivacy :: Ord RepositoryPrivacy

fromToMap :: Array (Tuple String RepositoryPrivacy)
fromToMap = [ Tuple "PUBLIC" Public, Tuple "PRIVATE" Private ]

instance repositoryPrivacyGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepositoryPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryPrivacy"
                                        fromToMap

instance repositoryPrivacyToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepositoryPrivacy where
  toGraphQLArgumentValue =
    case _ of
      Public -> ArgumentValueEnum "PUBLIC"
      Private -> ArgumentValueEnum "PRIVATE"
