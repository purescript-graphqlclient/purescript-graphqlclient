module Examples.Github.Enum.SecurityAdvisoryIdentifierType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SecurityAdvisoryIdentifierType
data SecurityAdvisoryIdentifierType = Cve | Ghsa

derive instance eqSecurityAdvisoryIdentifierType :: Eq SecurityAdvisoryIdentifierType

derive instance ordSecurityAdvisoryIdentifierType :: Ord SecurityAdvisoryIdentifierType

fromToMap :: Array (Tuple String SecurityAdvisoryIdentifierType)
fromToMap = [ Tuple "CVE" Cve, Tuple "GHSA" Ghsa ]

instance securityAdvisoryIdentifierTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                              SecurityAdvisoryIdentifierType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SecurityAdvisoryIdentifierType"
                                        fromToMap

instance securityAdvisoryIdentifierTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                 SecurityAdvisoryIdentifierType where
  toGraphQLArgumentValue =
    case _ of
      Cve -> ArgumentValueEnum "CVE"
      Ghsa -> ArgumentValueEnum "GHSA"
