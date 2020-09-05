module Examples.Github.Object.ExternalIdentitySamlAttributes where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__UserEmailMetadata, Scope__ExternalIdentitySamlAttributes)
import Data.Maybe (Maybe)

emails :: forall r . SelectionSet
                     Scope__UserEmailMetadata
                     r -> SelectionSet
                          Scope__ExternalIdentitySamlAttributes
                          (Maybe
                           (Array
                            r))
emails = selectionForCompositeField
         "emails"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

familyName :: SelectionSet Scope__ExternalIdentitySamlAttributes (Maybe String)
familyName = selectionForField
             "familyName"
             []
             graphqlDefaultResponseScalarDecoder

givenName :: SelectionSet Scope__ExternalIdentitySamlAttributes (Maybe String)
givenName = selectionForField "givenName" [] graphqlDefaultResponseScalarDecoder

groups :: SelectionSet
          Scope__ExternalIdentitySamlAttributes
          (Maybe
           (Array
            String))
groups = selectionForField "groups" [] graphqlDefaultResponseScalarDecoder

nameId :: SelectionSet Scope__ExternalIdentitySamlAttributes (Maybe String)
nameId = selectionForField "nameId" [] graphqlDefaultResponseScalarDecoder

username :: SelectionSet Scope__ExternalIdentitySamlAttributes (Maybe String)
username = selectionForField "username" [] graphqlDefaultResponseScalarDecoder
