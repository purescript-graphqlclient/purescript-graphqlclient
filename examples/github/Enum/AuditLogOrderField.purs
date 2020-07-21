module Examples.Github.Enum.AuditLogOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - AuditLogOrderField
data AuditLogOrderField
  = CreatedAt

fromToMap :: Array (Tuple String AuditLogOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance auditLogOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder AuditLogOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "AuditLogOrderField" fromToMap

instance auditLogOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue AuditLogOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
