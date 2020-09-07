module Examples.Github.Enum.RepositoryPrivacy where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryPrivacy
data RepositoryPrivacy = Public | Private

derive instance eqRepositoryPrivacy :: Eq RepositoryPrivacy

derive instance ordRepositoryPrivacy :: Ord RepositoryPrivacy

fromToMap :: Array (Tuple String RepositoryPrivacy)
fromToMap = [ Tuple "PUBLIC" Public, Tuple "PRIVATE" Private ]

instance repositoryPrivacyGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                 RepositoryPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryPrivacy"
                                        fromToMap

instance repositoryPrivacyToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                    RepositoryPrivacy where
  toGraphqlArgumentValue =
    case _ of
      Public -> ArgumentValueEnum "PUBLIC"
      Private -> ArgumentValueEnum "PRIVATE"
