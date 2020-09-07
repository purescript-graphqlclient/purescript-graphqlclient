module Examples.Github.Enum.EnterpriseServerUserAccountsUploadOrderField where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerUserAccountsUploadOrderField
data EnterpriseServerUserAccountsUploadOrderField = CreatedAt

derive instance eqEnterpriseServerUserAccountsUploadOrderField :: Eq EnterpriseServerUserAccountsUploadOrderField

derive instance ordEnterpriseServerUserAccountsUploadOrderField :: Ord EnterpriseServerUserAccountsUploadOrderField

fromToMap :: Array (Tuple String EnterpriseServerUserAccountsUploadOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance enterpriseServerUserAccountsUploadOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                            EnterpriseServerUserAccountsUploadOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseServerUserAccountsUploadOrderField"
                                        fromToMap

instance enterpriseServerUserAccountsUploadOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                               EnterpriseServerUserAccountsUploadOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
