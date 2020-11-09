module Examples.Github.Enum.OrgCreateAuditEntryBillingPlan where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgCreateAuditEntryBillingPlan
data OrgCreateAuditEntryBillingPlan
  = Free | Business | BusinessPlus | Unlimited | TieredPerSeat

derive instance genericOrgCreateAuditEntryBillingPlan :: Generic OrgCreateAuditEntryBillingPlan _

instance showOrgCreateAuditEntryBillingPlan :: Show
                                               OrgCreateAuditEntryBillingPlan where
  show = genericShow

derive instance eqOrgCreateAuditEntryBillingPlan :: Eq OrgCreateAuditEntryBillingPlan

derive instance ordOrgCreateAuditEntryBillingPlan :: Ord OrgCreateAuditEntryBillingPlan

fromToMap :: Array (Tuple String OrgCreateAuditEntryBillingPlan)
fromToMap = [ Tuple "FREE" Free
            , Tuple "BUSINESS" Business
            , Tuple "BUSINESS_PLUS" BusinessPlus
            , Tuple "UNLIMITED" Unlimited
            , Tuple "TIERED_PER_SEAT" TieredPerSeat
            ]

instance orgCreateAuditEntryBillingPlanGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                              OrgCreateAuditEntryBillingPlan where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgCreateAuditEntryBillingPlan"
                                        fromToMap

instance orgCreateAuditEntryBillingPlanToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                 OrgCreateAuditEntryBillingPlan where
  toGraphQLArgumentValue =
    case _ of
      Free -> ArgumentValueEnum "FREE"
      Business -> ArgumentValueEnum "BUSINESS"
      BusinessPlus -> ArgumentValueEnum "BUSINESS_PLUS"
      Unlimited -> ArgumentValueEnum "UNLIMITED"
      TieredPerSeat -> ArgumentValueEnum "TIERED_PER_SEAT"
