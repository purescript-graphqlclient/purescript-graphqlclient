module Examples.Github.Enum.AuditLogOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - AuditLogOrderField
data AuditLogOrderField = CreatedAt

derive instance eqAuditLogOrderField :: Eq AuditLogOrderField

derive instance ordAuditLogOrderField :: Ord AuditLogOrderField

fromToMap :: Array (Tuple String AuditLogOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance auditLogOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                  AuditLogOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "AuditLogOrderField"
                                        fromToMap

instance auditLogOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                     AuditLogOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
