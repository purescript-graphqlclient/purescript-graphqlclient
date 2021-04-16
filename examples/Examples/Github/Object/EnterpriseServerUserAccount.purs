module Examples.Github.Object.EnterpriseServerUserAccount where

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
  ( Scope__EnterpriseServerUserAccount
  , Scope__EnterpriseServerUserAccountEmailConnection
  , Scope__EnterpriseServerInstallation
  )
import Examples.Github.Scalars (DateTime, Id)
import Examples.Github.InputObject (EnterpriseServerUserAccountEmailOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__EnterpriseServerUserAccount DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

type EmailsInputRowOptional r
  = ( orderBy
      :: Optional
         Examples.Github.InputObject.EnterpriseServerUserAccountEmailOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type EmailsInput = { | EmailsInputRowOptional + () }

emails
  :: forall r
   . EmailsInput
  -> SelectionSet Scope__EnterpriseServerUserAccountEmailConnection r
  -> SelectionSet Scope__EnterpriseServerUserAccount r
emails input = selectionForCompositeField
               "emails"
               (toGraphQLArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

enterpriseServerInstallation
  :: forall r
   . SelectionSet Scope__EnterpriseServerInstallation r
  -> SelectionSet Scope__EnterpriseServerUserAccount r
enterpriseServerInstallation = selectionForCompositeField
                               "enterpriseServerInstallation"
                               []
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__EnterpriseServerUserAccount Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isSiteAdmin :: SelectionSet Scope__EnterpriseServerUserAccount Boolean
isSiteAdmin = selectionForField
              "isSiteAdmin"
              []
              graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__EnterpriseServerUserAccount String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

profileName :: SelectionSet Scope__EnterpriseServerUserAccount (Maybe String)
profileName = selectionForField
              "profileName"
              []
              graphqlDefaultResponseScalarDecoder

remoteCreatedAt :: SelectionSet Scope__EnterpriseServerUserAccount DateTime
remoteCreatedAt = selectionForField
                  "remoteCreatedAt"
                  []
                  graphqlDefaultResponseScalarDecoder

remoteUserId :: SelectionSet Scope__EnterpriseServerUserAccount Int
remoteUserId = selectionForField
               "remoteUserId"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__EnterpriseServerUserAccount DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
