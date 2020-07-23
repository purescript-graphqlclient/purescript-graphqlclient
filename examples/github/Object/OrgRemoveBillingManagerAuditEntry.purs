module Examples.Github.Object.OrgRemoveBillingManagerAuditEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgRemoveBillingManagerAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( Uri
  , PreciseDateTime
  , Id
  )
import Examples.Github.Enum.OperationType
  ( OperationType
  )
import Examples.Github.Enum.OrgRemoveBillingManagerAuditEntryReason
  ( OrgRemoveBillingManagerAuditEntryReason
  )

action :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet Scope__AuditEntryActor r -> SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet Scope__ActorLocation r -> SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe r)
actorLocation = selectionForCompositeField "actorLocation" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe String)
actorLogin = selectionForField "actorLogin" [] graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe Uri)
actorResourcePath = selectionForField "actorResourcePath" [] graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe OperationType)
operationType = selectionForField "operationType" [] graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe String)
organizationName = selectionForField "organizationName" [] graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField "organizationResourcePath" [] graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe Uri)
organizationUrl = selectionForField "organizationUrl" [] graphqlDefaultResponseScalarDecoder

reason :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe OrgRemoveBillingManagerAuditEntryReason)
reason = selectionForField "reason" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe Uri)
userResourcePath = selectionForField "userResourcePath" [] graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgRemoveBillingManagerAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
