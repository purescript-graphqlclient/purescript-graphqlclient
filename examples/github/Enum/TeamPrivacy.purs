module Examples.Github.Enum.TeamPrivacy where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
