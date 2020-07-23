module Examples.Github.Enum.EnterpriseServerUserAccountOrderField where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerUserAccountOrderField
data EnterpriseServerUserAccountOrderField
  = Login
  | RemoteCreatedAt

derive instance eqEnterpriseServerUserAccountOrderField :: Eq EnterpriseServerUserAccountOrderField

derive instance ordEnterpriseServerUserAccountOrderField :: Ord EnterpriseServerUserAccountOrderField

fromToMap :: Array (Tuple String EnterpriseServerUserAccountOrderField)
fromToMap = [Tuple "LOGIN" Login, Tuple "REMOTE_CREATED_AT" RemoteCreatedAt]

instance enterpriseServerUserAccountOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseServerUserAccountOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseServerUserAccountOrderField" fromToMap

instance enterpriseServerUserAccountOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseServerUserAccountOrderField where
  toGraphqlArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
      RemoteCreatedAt -> ArgumentValueEnum "REMOTE_CREATED_AT"
