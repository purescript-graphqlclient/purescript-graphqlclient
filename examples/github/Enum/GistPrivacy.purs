module Examples.Github.Enum.GistPrivacy where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - GistPrivacy
data GistPrivacy
  = Public
  | Secret
  | All

fromToMap :: Array (Tuple String GistPrivacy)
fromToMap = [Tuple "PUBLIC" Public, Tuple "SECRET" Secret, Tuple "ALL" All]

instance gistPrivacyGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder GistPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "GistPrivacy" fromToMap

instance gistPrivacyToGraphqlArgumentValue :: ToGraphqlArgumentValue GistPrivacy where
  toGraphqlArgumentValue =
    case _ of
      Public -> ArgumentValueString "PUBLIC"
      Secret -> ArgumentValueString "SECRET"
      All -> ArgumentValueString "ALL"
