module Examples.Github.Union.EnterpriseMember where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  (Scope__EnterpriseUserAccount, Scope__User, Scope__EnterpriseMember)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onEnterpriseUserAccount :: SelectionSet
                                                        Scope__EnterpriseUserAccount
                                                        decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__EnterpriseMember
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "EnterpriseUserAccount"
                         selections.onEnterpriseUserAccount
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onEnterpriseUserAccount: pure Nothing, onUser: pure Nothing }
