module Examples.Github.Object.StarredRepositoryConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__StarredRepositoryEdge
  , Scope__StarredRepositoryConnection
  , Scope__Repository
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges :: forall r . SelectionSet
                    Scope__StarredRepositoryEdge
                    r -> SelectionSet
                         Scope__StarredRepositoryConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

isOverLimit :: SelectionSet Scope__StarredRepositoryConnection Boolean
isOverLimit = selectionForField
              "isOverLimit"
              []
              graphqlDefaultResponseScalarDecoder

nodes :: forall r . SelectionSet
                    Scope__Repository
                    r -> SelectionSet
                         Scope__StarredRepositoryConnection
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
                            Scope__StarredRepositoryConnection
                            r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__StarredRepositoryConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
