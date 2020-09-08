module Examples.Github.Enum.CollaboratorAffiliation where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - CollaboratorAffiliation
data CollaboratorAffiliation = Outside | Direct | All

derive instance eqCollaboratorAffiliation :: Eq CollaboratorAffiliation

derive instance ordCollaboratorAffiliation :: Ord CollaboratorAffiliation

fromToMap :: Array (Tuple String CollaboratorAffiliation)
fromToMap = [ Tuple "OUTSIDE" Outside, Tuple "DIRECT" Direct, Tuple "ALL" All ]

instance collaboratorAffiliationGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                       CollaboratorAffiliation where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "CollaboratorAffiliation"
                                        fromToMap

instance collaboratorAffiliationToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                          CollaboratorAffiliation where
  toGraphQLArgumentValue =
    case _ of
      Outside -> ArgumentValueEnum "OUTSIDE"
      Direct -> ArgumentValueEnum "DIRECT"
      All -> ArgumentValueEnum "ALL"
