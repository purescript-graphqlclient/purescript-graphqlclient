module Examples.Github.Enum.SamlDigestAlgorithm where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SamlDigestAlgorithm
data SamlDigestAlgorithm = Sha1 | Sha256 | Sha384 | Sha512

derive instance eqSamlDigestAlgorithm :: Eq SamlDigestAlgorithm

derive instance ordSamlDigestAlgorithm :: Ord SamlDigestAlgorithm

fromToMap :: Array (Tuple String SamlDigestAlgorithm)
fromToMap = [ Tuple "SHA1" Sha1
            , Tuple "SHA256" Sha256
            , Tuple "SHA384" Sha384
            , Tuple "SHA512" Sha512
            ]

instance samlDigestAlgorithmGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                   SamlDigestAlgorithm where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SamlDigestAlgorithm"
                                        fromToMap

instance samlDigestAlgorithmToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                      SamlDigestAlgorithm where
  toGraphqlArgumentValue =
    case _ of
      Sha1 -> ArgumentValueEnum "SHA1"
      Sha256 -> ArgumentValueEnum "SHA256"
      Sha384 -> ArgumentValueEnum "SHA384"
      Sha512 -> ArgumentValueEnum "SHA512"
