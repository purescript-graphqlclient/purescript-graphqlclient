module Examples.Github.Union.CreatedIssueOrRestrictedContribution where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__CreatedIssueContribution
  , Scope__RestrictedContribution
  , Scope__CreatedIssueOrRestrictedContribution
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onCreatedIssueContribution :: SelectionSet
                                                           Scope__CreatedIssueContribution
                                                           decodesTo
                           , onRestrictedContribution :: SelectionSet
                                                         Scope__RestrictedContribution
                                                         decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__CreatedIssueOrRestrictedContribution
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CreatedIssueContribution"
                         selections.onCreatedIssueContribution
                       , buildFragment
                         "RestrictedContribution"
                         selections.onRestrictedContribution
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onCreatedIssueContribution: pure
                                               Nothing
                 , onRestrictedContribution: pure
                                             Nothing
                 }
