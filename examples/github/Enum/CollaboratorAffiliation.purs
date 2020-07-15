module Examples.Github.Enum.CollaboratorAffiliation where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - CollaboratorAffiliation
data CollaboratorAffiliation
  = Outside
  | Direct
  | All

fromToMap :: Array (Tuple String CollaboratorAffiliation)
fromToMap = [Tuple "OUTSIDE" Outside, Tuple "DIRECT" Direct, Tuple "ALL" All]

instance collaboratorAffiliationGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder CollaboratorAffiliation where
  graphqlDefaultResponseScalarDecoder = enumDecoder "CollaboratorAffiliation" fromToMap

instance collaboratorAffiliationToGraphqlArgumentValue :: ToGraphqlArgumentValue CollaboratorAffiliation where
  toGraphqlArgumentValue =
    case _ of
      Outside -> ArgumentValueString "OUTSIDE"
      Direct -> ArgumentValueString "DIRECT"
      All -> ArgumentValueString "ALL"
