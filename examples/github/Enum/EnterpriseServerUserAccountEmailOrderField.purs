module Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseServerUserAccountEmailOrderField
data EnterpriseServerUserAccountEmailOrderField
  = Email

fromToMap :: Array (Tuple String EnterpriseServerUserAccountEmailOrderField)
fromToMap = [Tuple "EMAIL" Email]

instance enterpriseServerUserAccountEmailOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseServerUserAccountEmailOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseServerUserAccountEmailOrderField" fromToMap

instance enterpriseServerUserAccountEmailOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseServerUserAccountEmailOrderField where
  toGraphqlArgumentValue =
    case _ of
      Email -> ArgumentValueEnum "EMAIL"
