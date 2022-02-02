module Examples.Github.Object.SponsorshipNewsletter where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__SponsorshipNewsletter, Scope__Sponsorable)
import Examples.Github.Scalars (DateTime, Id)

body :: SelectionSet Scope__SponsorshipNewsletter String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__SponsorshipNewsletter DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__SponsorshipNewsletter Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isPublished :: SelectionSet Scope__SponsorshipNewsletter Boolean
isPublished = selectionForField
              "isPublished"
              []
              graphqlDefaultResponseScalarDecoder

sponsorable
  :: forall r
   . SelectionSet Scope__Sponsorable r
  -> SelectionSet Scope__SponsorshipNewsletter r
sponsorable = selectionForCompositeField
              "sponsorable"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

subject :: SelectionSet Scope__SponsorshipNewsletter String
subject = selectionForField "subject" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__SponsorshipNewsletter DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
