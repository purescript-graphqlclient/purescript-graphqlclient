module Examples.Github.Object.OauthApplicationCreateAuditEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OauthApplicationCreateAuditEntry
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
import Examples.Github.Enum.OauthApplicationCreateAuditEntryState
  ( OauthApplicationCreateAuditEntryState
  )

action :: SelectionSet Scope__OauthApplicationCreateAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet Scope__AuditEntryActor r -> SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet Scope__ActorLocation r -> SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe r)
actorLocation = selectionForCompositeField "actorLocation" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe String)
actorLogin = selectionForField "actorLogin" [] graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
actorResourcePath = selectionForField "actorResourcePath" [] graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

applicationUrl :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
applicationUrl = selectionForField "applicationUrl" [] graphqlDefaultResponseScalarDecoder

callbackUrl :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
callbackUrl = selectionForField "callbackUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OauthApplicationCreateAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OauthApplicationCreateAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

oauthApplicationName :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe String)
oauthApplicationName = selectionForField "oauthApplicationName" [] graphqlDefaultResponseScalarDecoder

oauthApplicationResourcePath :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
oauthApplicationResourcePath = selectionForField "oauthApplicationResourcePath" [] graphqlDefaultResponseScalarDecoder

oauthApplicationUrl :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
oauthApplicationUrl = selectionForField "oauthApplicationUrl" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe OperationType)
operationType = selectionForField "operationType" [] graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe String)
organizationName = selectionForField "organizationName" [] graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField "organizationResourcePath" [] graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
organizationUrl = selectionForField "organizationUrl" [] graphqlDefaultResponseScalarDecoder

rateLimit :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Int)
rateLimit = selectionForField "rateLimit" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe OauthApplicationCreateAuditEntryState)
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
userResourcePath = selectionForField "userResourcePath" [] graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OauthApplicationCreateAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
