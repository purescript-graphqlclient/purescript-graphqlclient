module Examples.Github.Object.RestrictedContribution where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__RestrictedContribution, Scope__User)
import Examples.Github.Scalars (DateTime, Uri)

isRestricted :: SelectionSet Scope__RestrictedContribution Boolean
isRestricted = selectionForField
               "isRestricted"
               []
               graphqlDefaultResponseScalarDecoder

occurredAt :: SelectionSet Scope__RestrictedContribution DateTime
occurredAt = selectionForField
             "occurredAt"
             []
             graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__RestrictedContribution Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__RestrictedContribution Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__RestrictedContribution r
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
