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

data Author
  = Author

-- Simple queries
_id :: SelectionSet (id :: String) Dog
_id = SelectionSet RProxy

_breed :: SelectionSet (breed :: String) Dog
_breed = SelectionSet RProxy

-- Combining Simple queries combines types
_idBreed :: SelectionSet (id :: String, breed :: String) Dog
_idBreed = _id <~> _breed

-- Selection with a sub selection
_dogs :: forall r. SelectionSet r Dog -> SelectionSet (dogs :: (Array (Record r))) RootQuery
_dogs _ = SelectionSet RProxy

_cats :: forall r. SelectionSet r Cat -> SelectionSet (cats :: (Array (Record r))) RootQuery
_cats _ = SelectionSet RProxy

_isTiger :: SelectionSet (isTiger :: Boolean) Cat
_isTiger = SelectionSet RProxy

_details :: forall r. SelectionSet r Details -> SelectionSet (details :: (Record r)) Cat
_details _ = SelectionSet RProxy

_name :: SelectionSet (name :: String) Details
_name = SelectionSet RProxy

_about :: SelectionSet (about :: String) RootQuery
_about = SelectionSet RProxy

_author :: forall r. SelectionSet r Author -> SelectionSet (author :: (Record r)) RootQuery
_author _ = SelectionSet RProxy

_firstName :: SelectionSet (firstName :: String) Author
_firstName = SelectionSet RProxy

_lastName :: SelectionSet (lastName :: String) Author
_lastName = SelectionSet RProxy

-- /Examples
res :: Aff (Either MultipleErrors {author :: {firstName :: String, lastName :: String}})
res = gqlRequest "foo" (_author (_firstName <~> _lastName))

main :: Effect Unit
main = do
  log "hello"
  log $ writeGQL $ (_dogs (_id <~> _breed)) <~> (_cats ((_details _name) <~> _isTiger))
