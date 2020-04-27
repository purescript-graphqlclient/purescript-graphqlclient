module Fernet.Introspection.Schema.InputValue where

import Data.Maybe (Maybe)
import Fernet.GraphQL.SelectionSet (RawField(..), SelectionSet(..), noArgs)
import Fernet.Introspection.Schema.Types as Types
import Fernet.Introspection.Schema.TypeKind as TypeKind

kind :: SelectionSet ( kind :: TypeKind.TypeKind ) Types.InputValue
kind = noArgs "kind"

name :: SelectionSet ( name :: Maybe String ) Types.InputValue
name = noArgs "name"

description :: SelectionSet ( desciption :: Maybe String ) Types.InputValue
description = noArgs "kind"

type' ::
  forall r.
  SelectionSet r Types.Type ->
  SelectionSet ( type :: Record r ) Types.InputValue
type' (SelectionSet fields) = SelectionSet [ Composite "type" [] fields ]

defaultValue :: SelectionSet ( defaultValue :: Maybe String ) Types.InputValue
defaultValue = noArgs "defaultValue"
