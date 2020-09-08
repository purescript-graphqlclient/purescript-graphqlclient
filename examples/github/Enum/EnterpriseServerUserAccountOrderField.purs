module Examples.Github.Enum.EnterpriseServerUserAccountOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerUserAccountOrderField
data EnterpriseServerUserAccountOrderField = Login | RemoteCreatedAt

derive instance eqEnterpriseServerUserAccountOrderField :: Eq EnterpriseServerUserAccountOrderField

derive instance ordEnterpriseServerUserAccountOrderField :: Ord EnterpriseServerUserAccountOrderField

fromToMap :: Array (Tuple String EnterpriseServerUserAccountOrderField)
fromToMap = [ Tuple "LOGIN" Login, Tuple "REMOTE_CREATED_AT" RemoteCreatedAt ]

instance enterpriseServerUserAccountOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                     EnterpriseServerUserAccountOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseServerUserAccountOrderField"
                                        fromToMap

instance enterpriseServerUserAccountOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                        EnterpriseServerUserAccountOrderField where
  toGraphQLArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
      RemoteCreatedAt -> ArgumentValueEnum "REMOTE_CREATED_AT"
