module Fernet.Introspection.Schema.Query where

import Fernet.GraphQL.SelectionSet (RawField(..), RootQuery, SelectionSet(..))
import Fernet.Introspection.Schema.Types (Schema)
import Type.Data.Row (RProxy(..))

schema ::
  forall r.
  SelectionSet r Schema ->
  SelectionSet ( __schema :: Record r ) RootQuery
schema (SelectionSet fields) =
  SelectionSet
    [ Composite "__schema" [] fields ]

