module Examples.Github.Enum.GistPrivacy where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - GistPrivacy
data GistPrivacy
  = Public
  | Secret
  | All

derive instance eqGistPrivacy :: Eq GistPrivacy

derive instance ordGistPrivacy :: Ord GistPrivacy

fromToMap :: Array (Tuple String GistPrivacy)
fromToMap = [Tuple "PUBLIC" Public, Tuple "SECRET" Secret, Tuple "ALL" All]

instance gistPrivacyGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder GistPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "GistPrivacy" fromToMap

instance gistPrivacyToGraphqlArgumentValue :: ToGraphqlArgumentValue GistPrivacy where
  toGraphqlArgumentValue =
    case _ of
      Public -> ArgumentValueEnum "PUBLIC"
      Secret -> ArgumentValueEnum "SECRET"
      All -> ArgumentValueEnum "ALL"
