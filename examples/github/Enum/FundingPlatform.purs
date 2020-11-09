module Examples.Github.Enum.FundingPlatform where

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

-- | original name - FundingPlatform
data FundingPlatform
  = Github
  | Patreon
  | OpenCollective
  | KoFi
  | Tidelift
  | CommunityBridge
  | Liberapay
  | Issuehunt
  | Otechie
  | Custom

derive instance genericFundingPlatform :: Generic FundingPlatform _

instance showFundingPlatform :: Show FundingPlatform where
  show = genericShow

derive instance eqFundingPlatform :: Eq FundingPlatform

derive instance ordFundingPlatform :: Ord FundingPlatform

fromToMap :: Array (Tuple String FundingPlatform)
fromToMap = [ Tuple "GITHUB" Github
            , Tuple "PATREON" Patreon
            , Tuple "OPEN_COLLECTIVE" OpenCollective
            , Tuple "KO_FI" KoFi
            , Tuple "TIDELIFT" Tidelift
            , Tuple "COMMUNITY_BRIDGE" CommunityBridge
            , Tuple "LIBERAPAY" Liberapay
            , Tuple "ISSUEHUNT" Issuehunt
            , Tuple "OTECHIE" Otechie
            , Tuple "CUSTOM" Custom
            ]

instance fundingPlatformGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                               FundingPlatform where
  graphqlDefaultResponseScalarDecoder = enumDecoder "FundingPlatform" fromToMap

instance fundingPlatformToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                  FundingPlatform where
  toGraphQLArgumentValue =
    case _ of
      Github -> ArgumentValueEnum "GITHUB"
      Patreon -> ArgumentValueEnum "PATREON"
      OpenCollective -> ArgumentValueEnum "OPEN_COLLECTIVE"
      KoFi -> ArgumentValueEnum "KO_FI"
      Tidelift -> ArgumentValueEnum "TIDELIFT"
      CommunityBridge -> ArgumentValueEnum "COMMUNITY_BRIDGE"
      Liberapay -> ArgumentValueEnum "LIBERAPAY"
      Issuehunt -> ArgumentValueEnum "ISSUEHUNT"
      Otechie -> ArgumentValueEnum "OTECHIE"
      Custom -> ArgumentValueEnum "CUSTOM"
