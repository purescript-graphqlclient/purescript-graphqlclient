module Examples.Swapi.Object.Human where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Swapi.InputObject
import Type.Row
import Examples.Swapi.Enum.Episode
import Examples.Swapi.Enum.Language
import Examples.Swapi.Enum.Phrase
import Examples.Swapi.Scopes
import Examples.SwapiCustomScalars

appearsIn :: SelectionSet Scope__Human (Array Episode)
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Human String
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends :: forall r . SelectionSet Scope__Character r -> SelectionSet Scope__Human (Array r)
friends = selectionForCompositeField "friends" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

homePlanet :: SelectionSet Scope__Human (Maybe String)
homePlanet = selectionForField "homePlanet" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Human Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Human String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
