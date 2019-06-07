module Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Fernet.GraphQL.SelectionSet (ArraySelectionSet(..), SelectionSet(..), (<~>))
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Type.Proxy (Proxy(..))

-- Examples/
data RootQuery = RootQuery
data Dog = Dog
data Cat = Cat
data Details = Details

-- Simple queries
_id :: SelectionSet ( id :: Proxy String ) Dog
_id = SelectionSet { id: Proxy }

_breed :: SelectionSet ( breed :: Proxy String ) Dog
_breed = SelectionSet { breed: Proxy }

-- Combining Simple queries combines types
_idBreed :: SelectionSet ( id :: Proxy String, breed :: Proxy String) Dog
_idBreed = _id <~> _breed

-- Selection with a sub selection
_dogs :: forall r. SelectionSet r Dog -> SelectionSet ( dogs :: (ArraySelectionSet r Dog ) ) RootQuery
_dogs subSelection = SelectionSet { dogs: ArraySelectionSet subSelection }

_cats :: forall r. SelectionSet r Cat -> SelectionSet ( cats :: (ArraySelectionSet r Cat ) ) RootQuery
_cats subSelection = SelectionSet { cats: ArraySelectionSet subSelection }

_isTiger :: SelectionSet ( isTiger :: Proxy Boolean ) Cat
_isTiger = SelectionSet { isTiger: Proxy }

_details :: forall r. SelectionSet r Details -> SelectionSet ( details :: (SelectionSet r Details) ) Cat
_details subSelection = SelectionSet { details: subSelection }

_name :: SelectionSet ( name :: Proxy String ) Details
_name = SelectionSet { name: Proxy }
-- /Examples

main :: Effect Unit
main = do
  log $ writeGQL $ (_dogs (_id <~> _breed)) <~> (_cats ( (_details _name) <~> _isTiger ) )
