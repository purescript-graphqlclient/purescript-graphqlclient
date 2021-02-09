module Dillonkearns.Examples.Github.Enum.AuditLogOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - AuditLogOrderField
data AuditLogOrderField = CreatedAt

derive instance genericAuditLogOrderField :: Generic AuditLogOrderField _

instance showAuditLogOrderField :: Show AuditLogOrderField where
  show = genericShow

derive instance eqAuditLogOrderField :: Eq AuditLogOrderField

derive instance ordAuditLogOrderField :: Ord AuditLogOrderField

fromToMap :: Array (Tuple String AuditLogOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance auditLogOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder AuditLogOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "AuditLogOrderField"
                                        fromToMap

instance auditLogOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue AuditLogOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
