module Examples.Github.Object.OrgRestoreMemberMembershipTeamAuditEntryData where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Team, Scope__OrgRestoreMemberMembershipTeamAuditEntryData)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri)

team :: forall r . SelectionSet
                   Scope__Team
                   r -> SelectionSet
                        Scope__OrgRestoreMemberMembershipTeamAuditEntryData
                        (Maybe
                         r)
team = selectionForCompositeField
       "team"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamName :: SelectionSet
            Scope__OrgRestoreMemberMembershipTeamAuditEntryData
            (Maybe
             String)
teamName = selectionForField "teamName" [] graphqlDefaultResponseScalarDecoder

teamResourcePath :: SelectionSet
                    Scope__OrgRestoreMemberMembershipTeamAuditEntryData
                    (Maybe
                     Uri)
teamResourcePath = selectionForField
                   "teamResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

teamUrl :: SelectionSet
           Scope__OrgRestoreMemberMembershipTeamAuditEntryData
           (Maybe
            Uri)
teamUrl = selectionForField "teamUrl" [] graphqlDefaultResponseScalarDecoder
