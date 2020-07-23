module Examples.Github.Enum.RefOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RefOrderField
data RefOrderField
  = TagCommitDate
  | Alphabetical

fromToMap :: Array (Tuple String RefOrderField)
fromToMap = [Tuple "TAG_COMMIT_DATE" TagCommitDate, Tuple "ALPHABETICAL" Alphabetical]

instance refOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RefOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RefOrderField" fromToMap

instance refOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue RefOrderField where
  toGraphqlArgumentValue =
    case _ of
      TagCommitDate -> ArgumentValueEnum "TAG_COMMIT_DATE"
      Alphabetical -> ArgumentValueEnum "ALPHABETICAL"
