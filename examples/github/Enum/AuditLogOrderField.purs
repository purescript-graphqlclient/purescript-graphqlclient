module Examples.Github.Enum.AuditLogOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - AuditLogOrderField
data AuditLogOrderField = CreatedAt

derive instance eqAuditLogOrderField :: Eq AuditLogOrderField

derive instance ordAuditLogOrderField :: Ord AuditLogOrderField

fromToMap :: Array (Tuple String AuditLogOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance auditLogOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                  AuditLogOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "AuditLogOrderField"
                                        fromToMap

instance auditLogOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                     AuditLogOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
