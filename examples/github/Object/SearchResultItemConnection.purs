module Examples.Github.Object.SearchResultItemConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__SearchResultItemConnection
  , Scope__SearchResultItemEdge
  , Scope__SearchResultItem
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

codeCount :: SelectionSet Scope__SearchResultItemConnection Int
codeCount = selectionForField "codeCount" [] graphqlDefaultResponseScalarDecoder

edges
  :: forall r
   . SelectionSet Scope__SearchResultItemEdge r
  -> SelectionSet Scope__SearchResultItemConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

issueCount :: SelectionSet Scope__SearchResultItemConnection Int
issueCount = selectionForField
             "issueCount"
             []
             graphqlDefaultResponseScalarDecoder

nodes
  :: forall r
   . SelectionSet Scope__SearchResultItem r
  -> SelectionSet Scope__SearchResultItemConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__SearchResultItemConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryCount :: SelectionSet Scope__SearchResultItemConnection Int
repositoryCount = selectionForField
                  "repositoryCount"
                  []
                  graphqlDefaultResponseScalarDecoder

userCount :: SelectionSet Scope__SearchResultItemConnection Int
userCount = selectionForField "userCount" [] graphqlDefaultResponseScalarDecoder

wikiCount :: SelectionSet Scope__SearchResultItemConnection Int
wikiCount = selectionForField "wikiCount" [] graphqlDefaultResponseScalarDecoder
