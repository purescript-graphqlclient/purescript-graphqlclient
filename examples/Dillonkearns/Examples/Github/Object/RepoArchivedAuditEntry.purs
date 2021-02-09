module Dillonkearns.Examples.Github.Object.RepoArchivedAuditEntry where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__RepoArchivedAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__Repository
  , Scope__User
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Dillonkearns.Examples.Github.Enum.OperationType (OperationType)
import Dillonkearns.Examples.Github.Enum.RepoArchivedAuditEntryVisibility
  (RepoArchivedAuditEntryVisibility)

action :: SelectionSet Scope__RepoArchivedAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor
  :: forall r
   . SelectionSet Scope__AuditEntryActor r
  -> SelectionSet Scope__RepoArchivedAuditEntry (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation
  :: forall r
   . SelectionSet Scope__ActorLocation r
  -> SelectionSet Scope__RepoArchivedAuditEntry (Maybe r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__RepoArchivedAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RepoArchivedAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType
  :: SelectionSet
     Scope__RepoArchivedAuditEntry
     (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__RepoArchivedAuditEntry (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath
  :: SelectionSet
     Scope__RepoArchivedAuditEntry
     (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__RepoArchivedAuditEntry (Maybe r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe String)
repositoryName = selectionForField
                 "repositoryName"
                 []
                 graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe Uri)
repositoryResourcePath = selectionForField
                         "repositoryResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe Uri)
repositoryUrl = selectionForField
                "repositoryUrl"
                []
                graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__RepoArchivedAuditEntry (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__RepoArchivedAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder

visibility
  :: SelectionSet
     Scope__RepoArchivedAuditEntry
     (Maybe RepoArchivedAuditEntryVisibility)
visibility = selectionForField
             "visibility"
             []
             graphqlDefaultResponseScalarDecoder
