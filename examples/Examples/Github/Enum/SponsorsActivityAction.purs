module Examples.Github.Enum.SponsorsActivityAction where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SponsorsActivityAction
data SponsorsActivityAction
  = NewSponsorship
  | CancelledSponsorship
  | TierChange
  | Refund
  | PendingChange
  | SponsorMatchDisabled

derive instance genericSponsorsActivityAction
  ::
  Generic SponsorsActivityAction _

instance showSponsorsActivityAction :: Show SponsorsActivityAction where
  show = genericShow

derive instance eqSponsorsActivityAction :: Eq SponsorsActivityAction

derive instance ordSponsorsActivityAction :: Ord SponsorsActivityAction

fromToMap :: Array (Tuple String SponsorsActivityAction)
fromToMap = [ Tuple "NEW_SPONSORSHIP" NewSponsorship
            , Tuple "CANCELLED_SPONSORSHIP" CancelledSponsorship
            , Tuple "TIER_CHANGE" TierChange
            , Tuple "REFUND" Refund
            , Tuple "PENDING_CHANGE" PendingChange
            , Tuple "SPONSOR_MATCH_DISABLED" SponsorMatchDisabled
            ]

instance sponsorsActivityActionGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorsActivityAction where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorsActivityAction"
                                        fromToMap

instance sponsorsActivityActionToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorsActivityAction where
  toGraphQLArgumentValue =
    case _ of
      NewSponsorship -> ArgumentValueEnum "NEW_SPONSORSHIP"
      CancelledSponsorship -> ArgumentValueEnum "CANCELLED_SPONSORSHIP"
      TierChange -> ArgumentValueEnum "TIER_CHANGE"
      Refund -> ArgumentValueEnum "REFUND"
      PendingChange -> ArgumentValueEnum "PENDING_CHANGE"
      SponsorMatchDisabled -> ArgumentValueEnum "SPONSOR_MATCH_DISABLED"
