module Examples.Github.Enum.SamlDigestAlgorithm where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SamlDigestAlgorithm
data SamlDigestAlgorithm
  = Sha1
  | Sha256
  | Sha384
  | Sha512

fromToMap :: Array (Tuple String SamlDigestAlgorithm)
fromToMap = [Tuple "SHA1" Sha1, Tuple "SHA256" Sha256, Tuple "SHA384" Sha384, Tuple "SHA512" Sha512]

instance samlDigestAlgorithmGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SamlDigestAlgorithm where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SamlDigestAlgorithm" fromToMap

instance samlDigestAlgorithmToGraphqlArgumentValue :: ToGraphqlArgumentValue SamlDigestAlgorithm where
  toGraphqlArgumentValue =
    case _ of
      Sha1 -> ArgumentValueString "SHA1"
      Sha256 -> ArgumentValueString "SHA256"
      Sha384 -> ArgumentValueString "SHA384"
      Sha512 -> ArgumentValueString "SHA512"
