module Fernet.Introspection.Schema.Schema where

import Fernet.GraphQL.SelectionSet (RawField(..), SelectionSet(..))
import Fernet.Introspection.Schema.Types (Type, Schema)
import Type.Data.Row (RProxy(..))

types ::
  forall r.
  SelectionSet r Type ->
  SelectionSet ( types :: Array (Record r) ) Schema
types (SelectionSet fields) =
  SelectionSet
    [ Composite "types" [] fields ]


queryType ::
  forall r.
  SelectionSet r Type ->
  SelectionSet ( queryType :: Record r ) Schema
queryType (SelectionSet fields) =
  SelectionSet
    [ Composite "queryType" [] fields ]

