module Examples.Github.Object.EnterpriseServerUserAccountEmail where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__EnterpriseServerUserAccountEmail, Scope__EnterpriseServerUserAccount)
import Examples.Github.Scalars (DateTime, Id)

createdAt :: SelectionSet Scope__EnterpriseServerUserAccountEmail DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__EnterpriseServerUserAccountEmail String
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__EnterpriseServerUserAccountEmail Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isPrimary :: SelectionSet Scope__EnterpriseServerUserAccountEmail Boolean
isPrimary = selectionForField "isPrimary" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__EnterpriseServerUserAccountEmail DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

userAccount :: forall r . SelectionSet
                          Scope__EnterpriseServerUserAccount
                          r -> SelectionSet
                               Scope__EnterpriseServerUserAccountEmail
                               r
userAccount = selectionForCompositeField
              "userAccount"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
