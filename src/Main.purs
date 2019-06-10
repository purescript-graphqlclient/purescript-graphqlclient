module Main where

import Prelude

import Data.Either (Either)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class.Console (log)
import Fernet.GraphQL.HTTP (gqlRequest)
import Fernet.GraphQL.SelectionSet (ArraySelectionSet, RootQuery, SelectionSet(..), (<~>))
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Foreign (MultipleErrors)
import Type.Data.Row (RProxy(..))

-- Examples/
data Dog
  = Dog

data Cat
  = Cat

data Details
  = Details

-- Simple queries
_id :: SelectionSet (id :: String) Dog
_id = SelectionSet RProxy

_breed :: SelectionSet (breed :: String) Dog
_breed = SelectionSet RProxy

-- Combining Simple queries combines types
_idBreed :: SelectionSet (id :: String, breed :: String) Dog
_idBreed = _id <~> _breed

-- Selection with a sub selection
_dogs :: forall r. SelectionSet r Dog -> SelectionSet (dogs :: (ArraySelectionSet r Dog)) RootQuery
_dogs _ = SelectionSet RProxy

_cats :: forall r. SelectionSet r Cat -> SelectionSet (cats :: (ArraySelectionSet r Cat)) RootQuery
_cats _ = SelectionSet RProxy

_isTiger :: SelectionSet (isTiger :: Boolean) Cat
_isTiger = SelectionSet RProxy

_details :: forall r. SelectionSet r Details -> SelectionSet (details :: (SelectionSet r Details)) Cat
_details _ = SelectionSet RProxy

_name :: SelectionSet (name :: String) Details
_name = SelectionSet RProxy

_about :: SelectionSet (about :: String) RootQuery
_about = SelectionSet RProxy

-- /Examples
res :: Aff (Either MultipleErrors {about :: String})
res = gqlRequest "foo" _about

main :: Effect Unit
main = do
  log $ writeGQL $ (_dogs (_id <~> _breed)) <~> (_cats ((_details _name) <~> _isTiger))
