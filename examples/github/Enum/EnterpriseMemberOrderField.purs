module Examples.Github.Enum.EnterpriseMemberOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseMemberOrderField
data EnterpriseMemberOrderField
  = Login
  | CreatedAt

fromToMap :: Array (Tuple String EnterpriseMemberOrderField)
fromToMap = [Tuple "LOGIN" Login, Tuple "CREATED_AT" CreatedAt]

instance enterpriseMemberOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseMemberOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseMemberOrderField" fromToMap

instance enterpriseMemberOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseMemberOrderField where
  toGraphqlArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
