module Examples.Normalize.Union.ConflictingTypesUnion where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Normalize.Scopes
  ( Scope__Cat
  , Scope__Dog
  , Scope__ListId
  , Scope__MaybeId
  , Scope__ConflictingTypesUnion
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onCat :: SelectionSet Scope__Cat decodesTo
                           , onDog :: SelectionSet Scope__Dog decodesTo
                           , onListId :: SelectionSet Scope__ListId decodesTo
                           , onMaybeId :: SelectionSet Scope__MaybeId decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__ConflictingTypesUnion
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Cat" selections.onCat
                       , buildFragment "Dog" selections.onDog
                       , buildFragment "ListId" selections.onListId
                       , buildFragment "MaybeId" selections.onMaybeId
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onCat: pure
                          Nothing
                 , onDog: pure
                          Nothing
                 , onListId: pure
                             Nothing
                 , onMaybeId: pure
                              Nothing
                 }
