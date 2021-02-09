module Dillonkearns.Examples.Github.Object.OrgRestoreMemberMembershipOrganizationAuditEntryData where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__Organization
  , Scope__OrgRestoreMemberMembershipOrganizationAuditEntryData
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Uri)

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet
        Scope__OrgRestoreMemberMembershipOrganizationAuditEntryData
        (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName
  :: SelectionSet
     Scope__OrgRestoreMemberMembershipOrganizationAuditEntryData
     (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath
  :: SelectionSet
     Scope__OrgRestoreMemberMembershipOrganizationAuditEntryData
     (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl
  :: SelectionSet
     Scope__OrgRestoreMemberMembershipOrganizationAuditEntryData
     (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder
