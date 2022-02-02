module Examples.Github.Object.SponsorshipNewsletterEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__SponsorshipNewsletterEdge, Scope__SponsorshipNewsletter)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__SponsorshipNewsletterEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__SponsorshipNewsletter r
  -> SelectionSet Scope__SponsorshipNewsletterEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
