module Examples.Github.Enum.OrgCreateAuditEntryBillingPlan where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgCreateAuditEntryBillingPlan
data OrgCreateAuditEntryBillingPlan
  = Free
  | Business
  | BusinessPlus
  | Unlimited
  | TieredPerSeat

fromToMap :: Array (Tuple String OrgCreateAuditEntryBillingPlan)
fromToMap = [Tuple "FREE" Free, Tuple "BUSINESS" Business, Tuple "BUSINESS_PLUS" BusinessPlus, Tuple "UNLIMITED" Unlimited, Tuple "TIERED_PER_SEAT" TieredPerSeat]

instance orgCreateAuditEntryBillingPlanGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgCreateAuditEntryBillingPlan where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgCreateAuditEntryBillingPlan" fromToMap

instance orgCreateAuditEntryBillingPlanToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgCreateAuditEntryBillingPlan where
  toGraphqlArgumentValue =
    case _ of
      Free -> ArgumentValueEnum "FREE"
      Business -> ArgumentValueEnum "BUSINESS"
      BusinessPlus -> ArgumentValueEnum "BUSINESS_PLUS"
      Unlimited -> ArgumentValueEnum "UNLIMITED"
      TieredPerSeat -> ArgumentValueEnum "TIERED_PER_SEAT"
