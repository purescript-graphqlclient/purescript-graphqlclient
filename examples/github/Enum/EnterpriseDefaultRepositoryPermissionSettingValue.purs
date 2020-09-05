module Examples.Github.Enum.EnterpriseDefaultRepositoryPermissionSettingValue where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseDefaultRepositoryPermissionSettingValue
data EnterpriseDefaultRepositoryPermissionSettingValue
  = NoPolicy | Admin | Write | Read | None

derive instance eqEnterpriseDefaultRepositoryPermissionSettingValue :: Eq EnterpriseDefaultRepositoryPermissionSettingValue

derive instance ordEnterpriseDefaultRepositoryPermissionSettingValue :: Ord EnterpriseDefaultRepositoryPermissionSettingValue

fromToMap :: Array
             (Tuple
              String
              EnterpriseDefaultRepositoryPermissionSettingValue)
fromToMap = [ Tuple "NO_POLICY" NoPolicy
            , Tuple "ADMIN" Admin
            , Tuple "WRITE" Write
            , Tuple "READ" Read
            , Tuple "NONE" None
            ]

instance enterpriseDefaultRepositoryPermissionSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                                 EnterpriseDefaultRepositoryPermissionSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseDefaultRepositoryPermissionSettingValue"
                                        fromToMap

instance enterpriseDefaultRepositoryPermissionSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                                    EnterpriseDefaultRepositoryPermissionSettingValue where
  toGraphqlArgumentValue =
    case _ of
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
      Admin -> ArgumentValueEnum "ADMIN"
      Write -> ArgumentValueEnum "WRITE"
      Read -> ArgumentValueEnum "READ"
      None -> ArgumentValueEnum "NONE"
