module Examples.Github.Enum.SecurityAdvisoryIdentifierType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SecurityAdvisoryIdentifierType
data SecurityAdvisoryIdentifierType
  = Cve
  | Ghsa

fromToMap :: Array (Tuple String SecurityAdvisoryIdentifierType)
fromToMap = [Tuple "CVE" Cve, Tuple "GHSA" Ghsa]

instance securityAdvisoryIdentifierTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SecurityAdvisoryIdentifierType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SecurityAdvisoryIdentifierType" fromToMap

instance securityAdvisoryIdentifierTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue SecurityAdvisoryIdentifierType where
  toGraphqlArgumentValue =
    case _ of
      Cve -> ArgumentValueEnum "CVE"
      Ghsa -> ArgumentValueEnum "GHSA"
