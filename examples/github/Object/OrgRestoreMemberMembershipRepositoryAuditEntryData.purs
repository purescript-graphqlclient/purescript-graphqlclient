module Examples.Github.Object.OrgRestoreMemberMembershipRepositoryAuditEntryData where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Repository, Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri)

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
                              (Maybe
                               r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet
                  Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
                  (Maybe
                   String)
repositoryName = selectionForField
                 "repositoryName"
                 []
                 graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet
                          Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
                          (Maybe
                           Uri)
repositoryResourcePath = selectionForField
                         "repositoryResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet
                 Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
                 (Maybe
                  Uri)
repositoryUrl = selectionForField
                "repositoryUrl"
                []
                graphqlDefaultResponseScalarDecoder
