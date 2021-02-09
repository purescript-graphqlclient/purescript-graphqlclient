module Dillonkearns.Examples.Normalize.Object.Human where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Normalize.Scopes (Scope__Human, Scope__Character)
import Dillonkearns.Examples.Normalize.Enum.Episode (Episode)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Normalize.Scalars (Id)

appearsIn :: SelectionSet Scope__Human (Array Episode)
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

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
