module Examples.Github.Enum.SamlSignatureAlgorithm where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SamlSignatureAlgorithm
data SamlSignatureAlgorithm = RsaSha1 | RsaSha256 | RsaSha384 | RsaSha512

derive instance eqSamlSignatureAlgorithm :: Eq SamlSignatureAlgorithm

derive instance ordSamlSignatureAlgorithm :: Ord SamlSignatureAlgorithm

fromToMap :: Array (Tuple String SamlSignatureAlgorithm)
fromToMap = [ Tuple
              "RSA_SHA1"
              RsaSha1
            , Tuple "RSA_SHA256" RsaSha256
            , Tuple "RSA_SHA384" RsaSha384
            , Tuple "RSA_SHA512" RsaSha512
            ]

instance samlSignatureAlgorithmGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                      SamlSignatureAlgorithm where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SamlSignatureAlgorithm"
                                        fromToMap

instance samlSignatureAlgorithmToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                         SamlSignatureAlgorithm where
  toGraphqlArgumentValue =
    case _ of
      RsaSha1 -> ArgumentValueEnum "RSA_SHA1"
      RsaSha256 -> ArgumentValueEnum "RSA_SHA256"
      RsaSha384 -> ArgumentValueEnum "RSA_SHA384"
      RsaSha512 -> ArgumentValueEnum "RSA_SHA512"
