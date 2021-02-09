module Dillonkearns.Examples.Github.Object.OrgCreateAuditEntry where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__OrgCreateAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Dillonkearns.Examples.Github.Enum.OrgCreateAuditEntryBillingPlan
  (OrgCreateAuditEntryBillingPlan)
import Dillonkearns.Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__OrgCreateAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor
  :: forall r
   . SelectionSet Scope__AuditEntryActor r
  -> SelectionSet Scope__OrgCreateAuditEntry (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OrgCreateAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation
  :: forall r
   . SelectionSet Scope__ActorLocation r
  -> SelectionSet Scope__OrgCreateAuditEntry (Maybe r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OrgCreateAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__OrgCreateAuditEntry (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgCreateAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

billingPlan
  :: SelectionSet
     Scope__OrgCreateAuditEntry
     (Maybe OrgCreateAuditEntryBillingPlan)
billingPlan = selectionForField
              "billingPlan"
              []
              graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OrgCreateAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgCreateAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__OrgCreateAuditEntry (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__OrgCreateAuditEntry (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__OrgCreateAuditEntry (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__OrgCreateAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OrgCreateAuditEntry (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__OrgCreateAuditEntry (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OrgCreateAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__OrgCreateAuditEntry (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgCreateAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
