module Main where

import Prelude

import Data.Either (Either)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class.Console (log)
import Fernet.GraphQL.HTTP (gqlRequest)
import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet, proxy, (<~>))
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Foreign (MultipleErrors)

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
_id = proxy

_breed :: SelectionSet (breed :: String) Dog
_breed = proxy

-- Combining Simple queries combines types
_idBreed :: SelectionSet (id :: String, breed :: String) Dog
_idBreed = _id <~> _breed

-- Selection with a sub selection
_dogs :: forall r. SelectionSet r Dog -> SelectionSet (dogs :: (Array (Record r))) RootQuery
_dogs _ = proxy

_cats :: forall r. SelectionSet r Cat -> SelectionSet (cats :: (Array (Record r))) RootQuery
_cats _ = proxy

_isTiger :: SelectionSet (isTiger :: Boolean) Cat
_isTiger = proxy

_details :: forall r. SelectionSet r Details -> SelectionSet (details :: (Record r)) Cat
_details _ = proxy

_name :: SelectionSet (name :: String) Details
_name = proxy

_about :: SelectionSet (about :: String) RootQuery
_about = proxy

_author :: forall r. SelectionSet r Author -> SelectionSet (author :: (Record r)) RootQuery
_author _ = proxy

_firstName :: SelectionSet (firstName :: String) Author
_firstName = proxy

_lastName :: SelectionSet (lastName :: String) Author
_lastName = proxy 

-- /Examples
res :: Aff (Either MultipleErrors {author :: {firstName :: String, lastName :: String}})
res = gqlRequest "foo" (_author (_firstName <~> _lastName))

main :: Effect Unit
main = do
  log "hello"
  log $ writeGQL $ (_dogs (_id <~> _breed)) <~> (_cats ((_details _name) <~> _isTiger))
