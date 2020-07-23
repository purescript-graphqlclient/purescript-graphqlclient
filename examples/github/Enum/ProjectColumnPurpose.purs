module Examples.Github.Enum.ProjectColumnPurpose where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ProjectColumnPurpose
data ProjectColumnPurpose
  = Todo
  | InProgress
  | Done

fromToMap :: Array (Tuple String ProjectColumnPurpose)
fromToMap = [Tuple "TODO" Todo, Tuple "IN_PROGRESS" InProgress, Tuple "DONE" Done]

instance projectColumnPurposeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ProjectColumnPurpose where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectColumnPurpose" fromToMap

instance projectColumnPurposeToGraphqlArgumentValue :: ToGraphqlArgumentValue ProjectColumnPurpose where
  toGraphqlArgumentValue =
    case _ of
      Todo -> ArgumentValueEnum "TODO"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
      Done -> ArgumentValueEnum "DONE"
