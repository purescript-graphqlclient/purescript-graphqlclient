module Examples.Github.Object.EnterpriseServerInstallation where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseServerInstallation
  , Scope__EnterpriseServerUserAccountConnection
  , Scope__EnterpriseServerUserAccountsUploadConnection
  )
import Examples.Github.Scalars (DateTime, Id)
import Examples.Github.InputObject
  (EnterpriseServerUserAccountOrder, EnterpriseServerUserAccountsUploadOrder) as Examples.Github.InputObject
import Type.Row (type (+))

createdAt :: SelectionSet Scope__EnterpriseServerInstallation DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

customerName :: SelectionSet Scope__EnterpriseServerInstallation String
customerName = selectionForField
               "customerName"
               []
               graphqlDefaultResponseScalarDecoder

hostName :: SelectionSet Scope__EnterpriseServerInstallation String
hostName = selectionForField "hostName" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__EnterpriseServerInstallation Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isConnected :: SelectionSet Scope__EnterpriseServerInstallation Boolean
isConnected = selectionForField
              "isConnected"
              []
              graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__EnterpriseServerInstallation DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

type UserAccountsInputRowOptional r
  = ( orderBy
      :: Optional
         Examples.Github.InputObject.EnterpriseServerUserAccountOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type UserAccountsInput = { | UserAccountsInputRowOptional + () }

userAccounts
  :: forall r
   . UserAccountsInput
  -> SelectionSet Scope__EnterpriseServerUserAccountConnection r
  -> SelectionSet Scope__EnterpriseServerInstallation r
userAccounts input = selectionForCompositeField
                     "userAccounts"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UserAccountsUploadsInputRowOptional r
  = ( orderBy
      :: Optional
         Examples.Github.InputObject.EnterpriseServerUserAccountsUploadOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type UserAccountsUploadsInput = { | UserAccountsUploadsInputRowOptional + () }

userAccountsUploads
  :: forall r
   . UserAccountsUploadsInput
  -> SelectionSet Scope__EnterpriseServerUserAccountsUploadConnection r
  -> SelectionSet Scope__EnterpriseServerInstallation r
userAccountsUploads input = selectionForCompositeField
                            "userAccountsUploads"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer
