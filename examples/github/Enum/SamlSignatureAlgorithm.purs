module Examples.Github.Enum.SamlSignatureAlgorithm where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SamlSignatureAlgorithm
data SamlSignatureAlgorithm
  = RsaSha1
  | RsaSha256
  | RsaSha384
  | RsaSha512

fromToMap :: Array (Tuple String SamlSignatureAlgorithm)
fromToMap = [Tuple "RSA_SHA1" RsaSha1, Tuple "RSA_SHA256" RsaSha256, Tuple "RSA_SHA384" RsaSha384, Tuple "RSA_SHA512" RsaSha512]

instance samlSignatureAlgorithmGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SamlSignatureAlgorithm where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SamlSignatureAlgorithm" fromToMap

instance samlSignatureAlgorithmToGraphqlArgumentValue :: ToGraphqlArgumentValue SamlSignatureAlgorithm where
  toGraphqlArgumentValue =
    case _ of
      RsaSha1 -> ArgumentValueEnum "RSA_SHA1"
      RsaSha256 -> ArgumentValueEnum "RSA_SHA256"
      RsaSha384 -> ArgumentValueEnum "RSA_SHA384"
      RsaSha512 -> ArgumentValueEnum "RSA_SHA512"
