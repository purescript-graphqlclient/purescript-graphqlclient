module Examples.Github.Enum.ReactionOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ReactionOrderField
data ReactionOrderField
  = CreatedAt

fromToMap :: Array (Tuple String ReactionOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance reactionOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ReactionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ReactionOrderField" fromToMap

instance reactionOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue ReactionOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
