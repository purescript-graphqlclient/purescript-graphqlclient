module Dillonkearns.Examples.Swapi.Object.Droid where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Swapi.Scopes (Scope__Droid, Scope__Character)
import Dillonkearns.Examples.Swapi.Enum.Episode (Episode)
import Dillonkearns.Examples.SwapiCustomScalars (Id)
import Data.Maybe (Maybe)

appearsIn :: SelectionSet Scope__Droid (Array Episode)
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Droid String
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends
  :: forall r
   . SelectionSet Scope__Character r
  -> SelectionSet Scope__Droid (Array r)
friends = selectionForCompositeField
          "friends"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Droid Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Droid String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

primaryFunction :: SelectionSet Scope__Droid (Maybe String)
primaryFunction = selectionForField
                  "primaryFunction"
                  []
                  graphqlDefaultResponseScalarDecoder
