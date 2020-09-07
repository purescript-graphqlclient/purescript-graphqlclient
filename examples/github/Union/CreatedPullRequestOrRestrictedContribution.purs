module Examples.Github.Union.CreatedPullRequestOrRestrictedContribution where

import GraphqlClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__CreatedPullRequestContribution
  , Scope__RestrictedContribution
  , Scope__CreatedPullRequestOrRestrictedContribution
  )
import Data.Maybe (Maybe(..))
import Prelude

type Fragments decodesTo = { onCreatedPullRequestContribution :: SelectionSet
                                                                 Scope__CreatedPullRequestContribution
                                                                 decodesTo
                           , onRestrictedContribution :: SelectionSet
                                                         Scope__RestrictedContribution
                                                         decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__CreatedPullRequestOrRestrictedContribution
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CreatedPullRequestContribution"
                         selections.onCreatedPullRequestContribution
                       , buildFragment
                         "RestrictedContribution"
                         selections.onRestrictedContribution
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onCreatedPullRequestContribution: pure
                                                     Nothing
                 , onRestrictedContribution: pure
                                             Nothing
                 }
