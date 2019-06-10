module Fernet.Example.Countries.Continent where

import Fernet.Example.Countries.Types (Country, Continent)
import Fernet.GraphQL.SelectionSet (RawField(..), SelectionSet(..), noArgs)
import Type.Data.Row (RProxy(..))

code :: SelectionSet (code :: String) Continent
code = noArgs "code"

name :: SelectionSet (name :: String) Continent
name = noArgs "name"

countries ::
  forall r.
  SelectionSet r Country ->
  SelectionSet (countries :: Array (Record r)) Continent
countries (SelectionSet fields _) =
 SelectionSet
   [Composite "countries" [] fields] RProxy
