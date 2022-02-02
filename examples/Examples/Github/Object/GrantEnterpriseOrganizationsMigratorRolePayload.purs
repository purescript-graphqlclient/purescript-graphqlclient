module Examples.Github.Object.GrantEnterpriseOrganizationsMigratorRolePayload where

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
  ( Scope__GrantEnterpriseOrganizationsMigratorRolePayload
  , Scope__OrganizationConnection
  )
import Data.Maybe (Maybe)
import Type.Row (type (+))

clientMutationId
  :: SelectionSet
     Scope__GrantEnterpriseOrganizationsMigratorRolePayload
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
        Scope__GrantEnterpriseOrganizationsMigratorRolePayload
        (Maybe r)
organizations input = selectionForCompositeField
                      "organizations"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer
