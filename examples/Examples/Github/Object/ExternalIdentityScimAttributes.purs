module Examples.Github.Object.ExternalIdentityScimAttributes where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__UserEmailMetadata, Scope__ExternalIdentityScimAttributes)
import Data.Maybe (Maybe)

emails
  :: forall r
   . SelectionSet Scope__UserEmailMetadata r
  -> SelectionSet Scope__ExternalIdentityScimAttributes (Maybe (Array r))
emails = selectionForCompositeField
         "emails"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

familyName :: SelectionSet Scope__ExternalIdentityScimAttributes (Maybe String)
familyName = selectionForField
             "familyName"
             []
             graphqlDefaultResponseScalarDecoder

givenName :: SelectionSet Scope__ExternalIdentityScimAttributes (Maybe String)
givenName = selectionForField "givenName" [] graphqlDefaultResponseScalarDecoder

groups
  :: SelectionSet
     Scope__ExternalIdentityScimAttributes
     (Maybe (Array String))
groups = selectionForField "groups" [] graphqlDefaultResponseScalarDecoder

username :: SelectionSet Scope__ExternalIdentityScimAttributes (Maybe String)
username = selectionForField "username" [] graphqlDefaultResponseScalarDecoder
