module Dillonkearns.Examples.Swapi.Object.Human where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Swapi.Scopes (Scope__Human, Scope__Character)
import Dillonkearns.Examples.Swapi.Enum.Episode (Episode)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.SwapiCustomScalars (Id)

appearsIn :: SelectionSet Scope__Human (Array Episode)
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Human String
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends
  :: forall r
   . SelectionSet Scope__Character r
  -> SelectionSet Scope__Human (Array r)
friends = selectionForCompositeField
          "friends"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

homePlanet :: SelectionSet Scope__Human (Maybe String)
homePlanet = selectionForField
             "homePlanet"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Human Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Human String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
