module Examples.Github.Object.OrgRemoveOutsideCollaboratorAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgRemoveOutsideCollaboratorAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryMembershipType
  (OrgRemoveOutsideCollaboratorAuditEntryMembershipType)
import Examples.Github.Enum.OperationType (OperationType)
import Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryReason
  (OrgRemoveOutsideCollaboratorAuditEntryReason)

action :: SelectionSet Scope__OrgRemoveOutsideCollaboratorAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet
                    Scope__AuditEntryActor
                    r -> SelectionSet
                         Scope__OrgRemoveOutsideCollaboratorAuditEntry
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet
           Scope__OrgRemoveOutsideCollaboratorAuditEntry
           (Maybe
            String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet
                            Scope__ActorLocation
                            r -> SelectionSet
                                 Scope__OrgRemoveOutsideCollaboratorAuditEntry
                                 (Maybe
                                  r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet
              Scope__OrgRemoveOutsideCollaboratorAuditEntry
              (Maybe
               String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet
                     Scope__OrgRemoveOutsideCollaboratorAuditEntry
                     (Maybe
                      Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet
            Scope__OrgRemoveOutsideCollaboratorAuditEntry
            (Maybe
             Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet
             Scope__OrgRemoveOutsideCollaboratorAuditEntry
             PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgRemoveOutsideCollaboratorAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

membershipTypes :: SelectionSet
                   Scope__OrgRemoveOutsideCollaboratorAuditEntry
                   (Maybe
                    (Array
                     OrgRemoveOutsideCollaboratorAuditEntryMembershipType))
membershipTypes = selectionForField
                  "membershipTypes"
                  []
                  graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet
                 Scope__OrgRemoveOutsideCollaboratorAuditEntry
                 (Maybe
                  OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet
                           Scope__Organization
                           r -> SelectionSet
                                Scope__OrgRemoveOutsideCollaboratorAuditEntry
                                (Maybe
                                 r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet
                    Scope__OrgRemoveOutsideCollaboratorAuditEntry
                    (Maybe
                     String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet
                            Scope__OrgRemoveOutsideCollaboratorAuditEntry
                            (Maybe
                             Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet
                   Scope__OrgRemoveOutsideCollaboratorAuditEntry
                   (Maybe
                    Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

reason :: SelectionSet
          Scope__OrgRemoveOutsideCollaboratorAuditEntry
          (Maybe
           OrgRemoveOutsideCollaboratorAuditEntryReason)
reason = selectionForField "reason" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__OrgRemoveOutsideCollaboratorAuditEntry
                        (Maybe
                         r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet
             Scope__OrgRemoveOutsideCollaboratorAuditEntry
             (Maybe
              String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet
                    Scope__OrgRemoveOutsideCollaboratorAuditEntry
                    (Maybe
                     Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet
           Scope__OrgRemoveOutsideCollaboratorAuditEntry
           (Maybe
            Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
