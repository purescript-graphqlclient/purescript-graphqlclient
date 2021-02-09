module Dillonkearns.Examples.Github.Object.RepoDestroyAuditEntry where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__RepoDestroyAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__Repository
  , Scope__User
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Dillonkearns.Examples.Github.Enum.OperationType (OperationType)
import Dillonkearns.Examples.Github.Enum.RepoDestroyAuditEntryVisibility
  (RepoDestroyAuditEntryVisibility)

action :: SelectionSet Scope__RepoDestroyAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor
  :: forall r
   . SelectionSet Scope__AuditEntryActor r
  -> SelectionSet Scope__RepoDestroyAuditEntry (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation
  :: forall r
   . SelectionSet Scope__ActorLocation r
  -> SelectionSet Scope__RepoDestroyAuditEntry (Maybe r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__RepoDestroyAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RepoDestroyAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__RepoDestroyAuditEntry (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath
  :: SelectionSet
     Scope__RepoDestroyAuditEntry
     (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__RepoDestroyAuditEntry (Maybe r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe String)
repositoryName = selectionForField
                 "repositoryName"
                 []
                 graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe Uri)
repositoryResourcePath = selectionForField
                         "repositoryResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe Uri)
repositoryUrl = selectionForField
                "repositoryUrl"
                []
                graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__RepoDestroyAuditEntry (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__RepoDestroyAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder

visibility
  :: SelectionSet
     Scope__RepoDestroyAuditEntry
     (Maybe RepoDestroyAuditEntryVisibility)
visibility = selectionForField
             "visibility"
             []
             graphqlDefaultResponseScalarDecoder
