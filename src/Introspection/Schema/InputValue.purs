module Fernet.Introspection.Schema.InputValue where

import Data.Maybe (Maybe)
import Fernet.GraphQL.SelectionSet (RawField(..), SelectionSet(..), noArgs)
import Fernet.Introspection.Schema.Types (InputValue, Type, TypeKind)
import Type.Data.Row (RProxy(..))

kind :: SelectionSet ( kind :: TypeKind ) InputValue
kind = noArgs "kind"

name :: SelectionSet ( name :: Maybe String ) InputValue
name = noArgs "name"

description :: SelectionSet ( desciption :: Maybe String ) InputValue
description = noArgs "kind"

type' ::
  forall r.
  SelectionSet r Type ->
  SelectionSet ( type :: Record r ) InputValue
type' (SelectionSet fields) = SelectionSet [ Composite "type" [] fields ]

defaultValue :: SelectionSet ( defaultValue :: Maybe String ) InputValue
defaultValue = noArgs "defaultValue"
