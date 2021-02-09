module Examples.Swapi.Interface.Character where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Swapi.Scopes (Scope__Character, Scope__Droid, Scope__Human)
import Examples.Swapi.Enum.Episode (Episode)
import Examples.SwapiCustomScalars (Id)
import Data.Maybe (Maybe(..))
import Prelude (pure)

appearsIn :: SelectionSet Scope__Character (Array Episode)
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Character String
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends
  :: forall r
   . SelectionSet Scope__Character r
  -> SelectionSet Scope__Character (Array r)
friends = selectionForCompositeField
          "friends"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Character Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Character String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onDroid :: SelectionSet Scope__Droid decodesTo
    , onHuman :: SelectionSet Scope__Human decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Character decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Droid" selections.onDroid
                       , buildFragment "Human" selections.onHuman
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onDroid: pure Nothing, onHuman: pure Nothing }
