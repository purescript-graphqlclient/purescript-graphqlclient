module Examples.Github.Object.RevokeEnterpriseOrganizationsMigratorRolePayload where

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
  ( Scope__RevokeEnterpriseOrganizationsMigratorRolePayload
  , Scope__OrganizationConnection
  )
import Data.Maybe (Maybe)
import Type.Row (type (+))

clientMutationId
  :: SelectionSet
     Scope__RevokeEnterpriseOrganizationsMigratorRolePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

type OrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type OrganizationsInput = { | OrganizationsInputRowOptional + () }

organizations
  :: forall r
   . OrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet
        Scope__RevokeEnterpriseOrganizationsMigratorRolePayload
        (Maybe r)
organizations input = selectionForCompositeField
                      "organizations"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer
