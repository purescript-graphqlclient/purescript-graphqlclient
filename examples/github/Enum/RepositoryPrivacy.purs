module Examples.Github.Enum.RepositoryPrivacy where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepositoryPrivacy
data RepositoryPrivacy
  = Public
  | Private

fromToMap :: Array (Tuple String RepositoryPrivacy)
fromToMap = [Tuple "PUBLIC" Public, Tuple "PRIVATE" Private]

instance repositoryPrivacyGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryPrivacy" fromToMap

instance repositoryPrivacyToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryPrivacy where
  toGraphqlArgumentValue =
    case _ of
      Public -> ArgumentValueString "PUBLIC"
      Private -> ArgumentValueString "PRIVATE"
