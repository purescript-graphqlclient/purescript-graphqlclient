module Examples.Github.Enum.RepositoryPrivacy where

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

derive instance eqRepositoryPrivacy :: Eq RepositoryPrivacy

derive instance ordRepositoryPrivacy :: Ord RepositoryPrivacy

fromToMap :: Array (Tuple String RepositoryPrivacy)
fromToMap = [ Tuple "PUBLIC" Public, Tuple "PRIVATE" Private ]

instance repositoryPrivacyGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                 RepositoryPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryPrivacy"
                                        fromToMap

instance repositoryPrivacyToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                    RepositoryPrivacy where
  toGraphQLArgumentValue =
    case _ of
      Public -> ArgumentValueEnum "PUBLIC"
      Private -> ArgumentValueEnum "PRIVATE"
