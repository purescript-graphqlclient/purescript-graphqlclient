module Examples.Github.Object.CreatedIssueContributionEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CreatedIssueContributionEdge, Scope__CreatedIssueContribution)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CreatedIssueContributionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__CreatedIssueContribution
                   r -> SelectionSet
                        Scope__CreatedIssueContributionEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
