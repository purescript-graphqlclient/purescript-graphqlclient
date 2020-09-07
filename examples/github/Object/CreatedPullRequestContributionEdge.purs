module Examples.Github.Object.CreatedPullRequestContributionEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__CreatedPullRequestContributionEdge
  , Scope__CreatedPullRequestContribution
  )
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CreatedPullRequestContributionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__CreatedPullRequestContribution
                   r -> SelectionSet
                        Scope__CreatedPullRequestContributionEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
