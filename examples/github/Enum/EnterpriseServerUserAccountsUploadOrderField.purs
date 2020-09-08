module Examples.Github.Enum.EnterpriseServerUserAccountsUploadOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerUserAccountsUploadOrderField
data EnterpriseServerUserAccountsUploadOrderField = CreatedAt

derive instance eqEnterpriseServerUserAccountsUploadOrderField :: Eq EnterpriseServerUserAccountsUploadOrderField

derive instance ordEnterpriseServerUserAccountsUploadOrderField :: Ord EnterpriseServerUserAccountsUploadOrderField

fromToMap :: Array (Tuple String EnterpriseServerUserAccountsUploadOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance enterpriseServerUserAccountsUploadOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                            EnterpriseServerUserAccountsUploadOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseServerUserAccountsUploadOrderField"
                                        fromToMap

instance enterpriseServerUserAccountsUploadOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                               EnterpriseServerUserAccountsUploadOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
