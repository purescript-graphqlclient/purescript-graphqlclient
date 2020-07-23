module Examples.Github.Object.OrgDisableSamlAuditEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgDisableSamlAuditEntry
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

action :: SelectionSet Scope__OrgDisableSamlAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet Scope__AuditEntryActor r -> SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet Scope__ActorLocation r -> SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe r)
actorLocation = selectionForCompositeField "actorLocation" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe String)
actorLogin = selectionForField "actorLogin" [] graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
actorResourcePath = selectionForField "actorResourcePath" [] graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OrgDisableSamlAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

digestMethodUrl :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
digestMethodUrl = selectionForField "digestMethodUrl" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgDisableSamlAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

issuerUrl :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
issuerUrl = selectionForField "issuerUrl" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe OperationType)
operationType = selectionForField "operationType" [] graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe String)
organizationName = selectionForField "organizationName" [] graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField "organizationResourcePath" [] graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
organizationUrl = selectionForField "organizationUrl" [] graphqlDefaultResponseScalarDecoder

signatureMethodUrl :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
signatureMethodUrl = selectionForField "signatureMethodUrl" [] graphqlDefaultResponseScalarDecoder

singleSignOnUrl :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
singleSignOnUrl = selectionForField "singleSignOnUrl" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
userResourcePath = selectionForField "userResourcePath" [] graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgDisableSamlAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
