module Examples.Github.Object.EnterpriseUserAccount where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphQLArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__EnterpriseUserAccount
  , Scope__Enterprise
  , Scope__EnterpriseOrganizationMembershipConnection
  , Scope__User
  )
import Examples.Github.Scalars (Uri, DateTime, Id)
import Data.Maybe (Maybe)
import Examples.Github.InputObject (OrganizationOrder) as Examples.Github.InputObject
import Examples.Github.Enum.EnterpriseUserAccountMembershipRole
  (EnterpriseUserAccountMembershipRole)

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__EnterpriseUserAccount Uri
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__EnterpriseUserAccount DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

enterprise
  :: forall r
   . SelectionSet Scope__Enterprise r
  -> SelectionSet Scope__EnterpriseUserAccount r
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__EnterpriseUserAccount Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__EnterpriseUserAccount String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__EnterpriseUserAccount (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type OrganizationsInputRowOptional r
  = ( query :: Optional String
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    , role :: Optional EnterpriseUserAccountMembershipRole
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type OrganizationsInput = { | OrganizationsInputRowOptional + () }

organizations
  :: forall r
   . OrganizationsInput
  -> SelectionSet Scope__EnterpriseOrganizationMembershipConnection r
  -> SelectionSet Scope__EnterpriseUserAccount r
organizations input = selectionForCompositeField
                      "organizations"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__EnterpriseUserAccount Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__EnterpriseUserAccount DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__EnterpriseUserAccount Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__EnterpriseUserAccount (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
