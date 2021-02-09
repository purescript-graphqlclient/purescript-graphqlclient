module Dillonkearns.Examples.Github.Object.EnterpriseServerUserAccountsUpload where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__EnterpriseServerUserAccountsUpload
  , Scope__Enterprise
  , Scope__EnterpriseServerInstallation
  )
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)
import Dillonkearns.Examples.Github.Enum.EnterpriseServerUserAccountsUploadSyncState
  (EnterpriseServerUserAccountsUploadSyncState)

createdAt :: SelectionSet Scope__EnterpriseServerUserAccountsUpload DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

enterprise
  :: forall r
   . SelectionSet Scope__Enterprise r
  -> SelectionSet Scope__EnterpriseServerUserAccountsUpload r
enterprise = selectionForCompositeField
             "enterprise"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

enterpriseServerInstallation
  :: forall r
   . SelectionSet Scope__EnterpriseServerInstallation r
  -> SelectionSet Scope__EnterpriseServerUserAccountsUpload r
enterpriseServerInstallation = selectionForCompositeField
                               "enterpriseServerInstallation"
                               []
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__EnterpriseServerUserAccountsUpload Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__EnterpriseServerUserAccountsUpload String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

syncState
  :: SelectionSet
     Scope__EnterpriseServerUserAccountsUpload
     EnterpriseServerUserAccountsUploadSyncState
syncState = selectionForField "syncState" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__EnterpriseServerUserAccountsUpload DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
