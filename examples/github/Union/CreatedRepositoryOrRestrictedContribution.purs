module Examples.Github.Union.CreatedRepositoryOrRestrictedContribution where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__CreatedRepositoryContribution
  , Scope__RestrictedContribution
  , Scope__CreatedRepositoryOrRestrictedContribution
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onCreatedRepositoryContribution
      :: SelectionSet
         Scope__CreatedRepositoryContribution
         decodesTo
    , onRestrictedContribution
      :: SelectionSet
         Scope__RestrictedContribution
         decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__CreatedRepositoryOrRestrictedContribution decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CreatedRepositoryContribution"
                         selections.onCreatedRepositoryContribution
                       , buildFragment
                         "RestrictedContribution"
                         selections.onRestrictedContribution
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onCreatedRepositoryContribution: pure
                                                    Nothing
                 , onRestrictedContribution: pure
                                             Nothing
                 }
