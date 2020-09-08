module Examples.Github.Object.CreatedRepositoryContributionConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__CreatedRepositoryContributionEdge
  , Scope__CreatedRepositoryContributionConnection
  , Scope__CreatedRepositoryContribution
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges :: forall r . SelectionSet
                    Scope__CreatedRepositoryContributionEdge
                    r -> SelectionSet
                         Scope__CreatedRepositoryContributionConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet
                    Scope__CreatedRepositoryContribution
                    r -> SelectionSet
                         Scope__CreatedRepositoryContributionConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet
                       Scope__PageInfo
                       r -> SelectionSet
                            Scope__CreatedRepositoryContributionConnection
                            r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__CreatedRepositoryContributionConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
