module Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
