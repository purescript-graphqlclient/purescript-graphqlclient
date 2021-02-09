module Dillonkearns.Examples.Github.Object.OrgRestoreMemberMembershipRepositoryAuditEntryData where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Repository, Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Uri)

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet
        Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
        (Maybe r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName
  :: SelectionSet
     Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
     (Maybe String)
repositoryName = selectionForField
                 "repositoryName"
                 []
                 graphqlDefaultResponseScalarDecoder

repositoryResourcePath
  :: SelectionSet
     Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
     (Maybe Uri)
repositoryResourcePath = selectionForField
                         "repositoryResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

repositoryUrl
  :: SelectionSet
     Scope__OrgRestoreMemberMembershipRepositoryAuditEntryData
     (Maybe Uri)
repositoryUrl = selectionForField
                "repositoryUrl"
                []
                graphqlDefaultResponseScalarDecoder
