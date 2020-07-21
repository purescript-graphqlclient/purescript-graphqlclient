module Examples.Github.Enum.TeamPrivacy where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - TeamPrivacy
data TeamPrivacy
  = Secret
  | Visible

fromToMap :: Array (Tuple String TeamPrivacy)
fromToMap = [Tuple "SECRET" Secret, Tuple "VISIBLE" Visible]

instance teamPrivacyGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamPrivacy" fromToMap

instance teamPrivacyToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamPrivacy where
  toGraphqlArgumentValue =
    case _ of
      Secret -> ArgumentValueEnum "SECRET"
      Visible -> ArgumentValueEnum "VISIBLE"
