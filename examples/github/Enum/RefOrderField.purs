module Examples.Github.Enum.RefOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

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
      TagCommitDate -> ArgumentValueString "TAG_COMMIT_DATE"
      Alphabetical -> ArgumentValueString "ALPHABETICAL"
