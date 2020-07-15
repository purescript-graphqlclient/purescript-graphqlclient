module Examples.Github.Enum.FundingPlatform where

import Prelude
import GraphqlClient
import Data.Tuple

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

fromToMap :: Array (Tuple String FundingPlatform)
fromToMap = [Tuple "GITHUB" Github, Tuple "PATREON" Patreon, Tuple "OPEN_COLLECTIVE" OpenCollective, Tuple "KO_FI" KoFi, Tuple "TIDELIFT" Tidelift, Tuple "COMMUNITY_BRIDGE" CommunityBridge, Tuple "LIBERAPAY" Liberapay, Tuple "ISSUEHUNT" Issuehunt, Tuple "OTECHIE" Otechie, Tuple "CUSTOM" Custom]

instance fundingPlatformGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder FundingPlatform where
  graphqlDefaultResponseScalarDecoder = enumDecoder "FundingPlatform" fromToMap

instance fundingPlatformToGraphqlArgumentValue :: ToGraphqlArgumentValue FundingPlatform where
  toGraphqlArgumentValue =
    case _ of
      Github -> ArgumentValueString "GITHUB"
      Patreon -> ArgumentValueString "PATREON"
      OpenCollective -> ArgumentValueString "OPEN_COLLECTIVE"
      KoFi -> ArgumentValueString "KO_FI"
      Tidelift -> ArgumentValueString "TIDELIFT"
      CommunityBridge -> ArgumentValueString "COMMUNITY_BRIDGE"
      Liberapay -> ArgumentValueString "LIBERAPAY"
      Issuehunt -> ArgumentValueString "ISSUEHUNT"
      Otechie -> ArgumentValueString "OTECHIE"
      Custom -> ArgumentValueString "CUSTOM"
