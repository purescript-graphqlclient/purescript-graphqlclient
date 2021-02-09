module Dillonkearns.Examples.Github.Interface.OauthApplicationAuditEntryData where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__OauthApplicationAuditEntryData
  , Scope__OauthApplicationCreateAuditEntry
  , Scope__OrgOauthAppAccessApprovedAuditEntry
  , Scope__OrgOauthAppAccessDeniedAuditEntry
  , Scope__OrgOauthAppAccessRequestedAuditEntry
  )
import Data.Maybe (Maybe(..))
import Dillonkearns.Examples.Github.Scalars (Uri)
import Prelude (pure)

oauthApplicationName
  :: SelectionSet
     Scope__OauthApplicationAuditEntryData
     (Maybe String)
oauthApplicationName = selectionForField
                       "oauthApplicationName"
                       []
                       graphqlDefaultResponseScalarDecoder

oauthApplicationResourcePath
  :: SelectionSet
     Scope__OauthApplicationAuditEntryData
     (Maybe Uri)
oauthApplicationResourcePath = selectionForField
                               "oauthApplicationResourcePath"
                               []
                               graphqlDefaultResponseScalarDecoder

oauthApplicationUrl
  :: SelectionSet
     Scope__OauthApplicationAuditEntryData
     (Maybe Uri)
oauthApplicationUrl = selectionForField
                      "oauthApplicationUrl"
                      []
                      graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onOauthApplicationCreateAuditEntry
      :: SelectionSet
         Scope__OauthApplicationCreateAuditEntry
         decodesTo
    , onOrgOauthAppAccessApprovedAuditEntry
      :: SelectionSet
         Scope__OrgOauthAppAccessApprovedAuditEntry
         decodesTo
    , onOrgOauthAppAccessDeniedAuditEntry
      :: SelectionSet
         Scope__OrgOauthAppAccessDeniedAuditEntry
         decodesTo
    , onOrgOauthAppAccessRequestedAuditEntry
      :: SelectionSet
         Scope__OrgOauthAppAccessRequestedAuditEntry
         decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__OauthApplicationAuditEntryData decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "OauthApplicationCreateAuditEntry"
                         selections.onOauthApplicationCreateAuditEntry
                       , buildFragment
                         "OrgOauthAppAccessApprovedAuditEntry"
                         selections.onOrgOauthAppAccessApprovedAuditEntry
                       , buildFragment
                         "OrgOauthAppAccessDeniedAuditEntry"
                         selections.onOrgOauthAppAccessDeniedAuditEntry
                       , buildFragment
                         "OrgOauthAppAccessRequestedAuditEntry"
                         selections.onOrgOauthAppAccessRequestedAuditEntry
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onOauthApplicationCreateAuditEntry: pure
                                                       Nothing
                 , onOrgOauthAppAccessApprovedAuditEntry: pure
                                                          Nothing
                 , onOrgOauthAppAccessDeniedAuditEntry: pure
                                                        Nothing
                 , onOrgOauthAppAccessRequestedAuditEntry: pure
                                                           Nothing
                 }
