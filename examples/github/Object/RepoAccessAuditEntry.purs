module Examples.Github.Object.RepoAccessAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__RepoAccessAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__Repository
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)
import Examples.Github.Enum.RepoAccessAuditEntryVisibility
  (RepoAccessAuditEntryVisibility)

action :: SelectionSet Scope__RepoAccessAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet
                    Scope__AuditEntryActor
                    r -> SelectionSet
                         Scope__RepoAccessAuditEntry
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__RepoAccessAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet
                            Scope__ActorLocation
                            r -> SelectionSet
                                 Scope__RepoAccessAuditEntry
                                 (Maybe
                                  r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__RepoAccessAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__RepoAccessAuditEntry (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__RepoAccessAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__RepoAccessAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RepoAccessAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__RepoAccessAuditEntry (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet
                           Scope__Organization
                           r -> SelectionSet
                                Scope__RepoAccessAuditEntry
                                (Maybe
                                 r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__RepoAccessAuditEntry (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__RepoAccessAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__RepoAccessAuditEntry (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__RepoAccessAuditEntry
                              (Maybe
                               r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet Scope__RepoAccessAuditEntry (Maybe String)
repositoryName = selectionForField
                 "repositoryName"
                 []
                 graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet Scope__RepoAccessAuditEntry (Maybe Uri)
repositoryResourcePath = selectionForField
                         "repositoryResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet Scope__RepoAccessAuditEntry (Maybe Uri)
repositoryUrl = selectionForField
                "repositoryUrl"
                []
                graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__RepoAccessAuditEntry
                        (Maybe
                         r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__RepoAccessAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__RepoAccessAuditEntry (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__RepoAccessAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder

visibility :: SelectionSet
              Scope__RepoAccessAuditEntry
              (Maybe
               RepoAccessAuditEntryVisibility)
visibility = selectionForField
             "visibility"
             []
             graphqlDefaultResponseScalarDecoder
