module Examples.Github.Enum.FundingPlatform where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
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

derive instance eqFundingPlatform :: Eq FundingPlatform

derive instance ordFundingPlatform :: Ord FundingPlatform

fromToMap :: Array (Tuple String FundingPlatform)
fromToMap = [ Tuple
              "GITHUB"
              Github
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

instance fundingPlatformGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                               FundingPlatform where
  graphqlDefaultResponseScalarDecoder = enumDecoder "FundingPlatform" fromToMap

instance fundingPlatformToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                  FundingPlatform where
  toGraphqlArgumentValue =
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
