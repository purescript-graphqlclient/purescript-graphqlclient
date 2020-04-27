module Fernet.Example.Countries.Continent where

import Data.Maybe (Maybe)
import Fernet.Example.Countries.Types (Country, Continent)
import Fernet.Graphql.SelectionSet (RawField(..), SelectionSet(..), noArgs)
import Type.Data.Row (RProxy(..))

code :: SelectionSet (code :: Maybe String) Continent
code = noArgs "code"

name :: SelectionSet (name :: Maybe String) Continent
name = noArgs "name"

countries ::
  forall r.
  SelectionSet r Country ->
  SelectionSet (countries :: Array (Record r)) Continent
countries (SelectionSet fields) =
 SelectionSet
   [Composite "countries" [] fields]
