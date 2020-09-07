module Examples.Github.Object.OrgAddBillingManagerAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgAddBillingManagerAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__OrgAddBillingManagerAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet
                    Scope__AuditEntryActor
                    r -> SelectionSet
                         Scope__OrgAddBillingManagerAuditEntry
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OrgAddBillingManagerAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet
                            Scope__ActorLocation
                            r -> SelectionSet
                                 Scope__OrgAddBillingManagerAuditEntry
                                 (Maybe
                                  r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OrgAddBillingManagerAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet
                     Scope__OrgAddBillingManagerAuditEntry
                     (Maybe
                      Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgAddBillingManagerAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OrgAddBillingManagerAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgAddBillingManagerAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

invitationEmail :: SelectionSet
                   Scope__OrgAddBillingManagerAuditEntry
                   (Maybe
                    String)
invitationEmail = selectionForField
                  "invitationEmail"
                  []
                  graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet
                 Scope__OrgAddBillingManagerAuditEntry
                 (Maybe
                  OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet
                           Scope__Organization
                           r -> SelectionSet
                                Scope__OrgAddBillingManagerAuditEntry
                                (Maybe
                                 r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet
                    Scope__OrgAddBillingManagerAuditEntry
                    (Maybe
                     String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet
                            Scope__OrgAddBillingManagerAuditEntry
                            (Maybe
                             Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet
                   Scope__OrgAddBillingManagerAuditEntry
                   (Maybe
                    Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__OrgAddBillingManagerAuditEntry
                        (Maybe
                         r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OrgAddBillingManagerAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet
                    Scope__OrgAddBillingManagerAuditEntry
                    (Maybe
                     Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgAddBillingManagerAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
