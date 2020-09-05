module Examples.Github.Object.Enterprise where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphqlArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__Enterprise
  , Scope__EnterpriseBillingInfo
  , Scope__EnterpriseMemberConnection
  , Scope__OrganizationConnection
  , Scope__EnterpriseOwnerInfo
  , Scope__EnterpriseUserAccountConnection
  )
import Examples.Github.Scalars (Uri, DateTime, Html, Id)
import Data.Maybe (Maybe)
import Examples.Github.InputObject (EnterpriseMemberOrder, OrganizationOrder) as Examples.Github.InputObject
import Examples.Github.Enum.EnterpriseUserAccountMembershipRole
  (EnterpriseUserAccountMembershipRole)
import Examples.Github.Enum.EnterpriseUserDeployment (EnterpriseUserDeployment)

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Enterprise Uri
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

billingInfo :: forall r . SelectionSet
                          Scope__EnterpriseBillingInfo
                          r -> SelectionSet
                               Scope__Enterprise
                               (Maybe
                                r)
billingInfo = selectionForCompositeField
              "billingInfo"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Enterprise DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Enterprise (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Enterprise (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__Enterprise Html
descriptionHTML = selectionForField
                  "descriptionHTML"
                  []
                  graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Enterprise Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

location :: SelectionSet Scope__Enterprise (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

type MembersInputRowOptional r = ( organizationLogins :: Optional (Array String)
                                 , query :: Optional String
                                 , orderBy :: Optional
                                              Examples.Github.InputObject.EnterpriseMemberOrder
                                 , role :: Optional
                                           EnterpriseUserAccountMembershipRole
                                 , deployment :: Optional
                                                 EnterpriseUserDeployment
                                 , after :: Optional String
                                 , before :: Optional String
                                 , first :: Optional Int
                                 , last :: Optional Int
                                 | r
                                 )

type MembersInput = { | MembersInputRowOptional + () }

members :: forall r . MembersInput -> SelectionSet
                                      Scope__EnterpriseMemberConnection
                                      r -> SelectionSet
                                           Scope__Enterprise
                                           r
members input = selectionForCompositeField
                "members"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

name :: SelectionSet Scope__Enterprise String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type OrganizationsInputRowOptional r = ( query :: Optional String
                                       , orderBy :: Optional
                                                    Examples.Github.InputObject.OrganizationOrder
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type OrganizationsInput = { | OrganizationsInputRowOptional + () }

organizations :: forall r . OrganizationsInput -> SelectionSet
                                                  Scope__OrganizationConnection
                                                  r -> SelectionSet
                                                       Scope__Enterprise
                                                       r
organizations input = selectionForCompositeField
                      "organizations"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ownerInfo :: forall r . SelectionSet
                        Scope__EnterpriseOwnerInfo
                        r -> SelectionSet
                             Scope__Enterprise
                             (Maybe
                              r)
ownerInfo = selectionForCompositeField
            "ownerInfo"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Enterprise Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__Enterprise String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Enterprise Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type UserAccountsInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type UserAccountsInput = { | UserAccountsInputRowOptional + () }

userAccounts :: forall r . UserAccountsInput -> SelectionSet
                                                Scope__EnterpriseUserAccountConnection
                                                r -> SelectionSet
                                                     Scope__Enterprise
                                                     r
userAccounts input = selectionForCompositeField
                     "userAccounts"
                     (toGraphqlArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerIsAdmin :: SelectionSet Scope__Enterprise Boolean
viewerIsAdmin = selectionForField
                "viewerIsAdmin"
                []
                graphqlDefaultResponseScalarDecoder

websiteUrl :: SelectionSet Scope__Enterprise (Maybe Uri)
websiteUrl = selectionForField
             "websiteUrl"
             []
             graphqlDefaultResponseScalarDecoder
