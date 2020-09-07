module Examples.Github.Object.EnterpriseServerUserAccountEmailConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseServerUserAccountEmailEdge
  , Scope__EnterpriseServerUserAccountEmailConnection
  , Scope__EnterpriseServerUserAccountEmail
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges :: forall r . SelectionSet
                    Scope__EnterpriseServerUserAccountEmailEdge
                    r -> SelectionSet
                         Scope__EnterpriseServerUserAccountEmailConnection
                         (Maybe
                          (Array
                           (Maybe
                            r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet
                    Scope__EnterpriseServerUserAccountEmail
                    r -> SelectionSet
                         Scope__EnterpriseServerUserAccountEmailConnection
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
                            Scope__EnterpriseServerUserAccountEmailConnection
                            r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__EnterpriseServerUserAccountEmailConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
