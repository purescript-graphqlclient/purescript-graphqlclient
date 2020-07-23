module Examples.Github.Enum.CollaboratorAffiliation where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - CollaboratorAffiliation
data CollaboratorAffiliation
  = Outside
  | Direct
  | All

derive instance eqCollaboratorAffiliation :: Eq CollaboratorAffiliation

derive instance ordCollaboratorAffiliation :: Ord CollaboratorAffiliation

fromToMap :: Array (Tuple String CollaboratorAffiliation)
fromToMap = [Tuple "OUTSIDE" Outside, Tuple "DIRECT" Direct, Tuple "ALL" All]

instance collaboratorAffiliationGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder CollaboratorAffiliation where
  graphqlDefaultResponseScalarDecoder = enumDecoder "CollaboratorAffiliation" fromToMap

instance collaboratorAffiliationToGraphqlArgumentValue :: ToGraphqlArgumentValue CollaboratorAffiliation where
  toGraphqlArgumentValue =
    case _ of
      Outside -> ArgumentValueEnum "OUTSIDE"
      Direct -> ArgumentValueEnum "DIRECT"
      All -> ArgumentValueEnum "ALL"
