module Fernet.Introspection.Schema.Field where

import Prelude
import Data.Maybe (Maybe)
import Fernet.GraphQL.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), SelectionSet(..), noArgs)
import Fernet.Introspection.Schema.Types as Fernet.Introspection.Schema.Types
import Type.Data.Row (RProxy(..))

name :: SelectionSet ( name :: String ) Fernet.Introspection.Schema.Types.Field
name = noArgs "name"

description :: SelectionSet ( description :: String ) Fernet.Introspection.Schema.Types.Field
description = noArgs "description"

args ::
  forall r.
  Maybe Boolean ->
  SelectionSet r Fernet.Introspection.Schema.Types.InputValue ->
  SelectionSet ( args :: Array (Record r) ) Fernet.Introspection.Schema.Types.Field
args includeDeprecated (SelectionSet fields) =
  SelectionSet
    [ Composite
        "args"
        [ OptionalArgument
            "includeDeprecated"
            (ArgBoolean <$> includeDeprecated)
        ]
        fields
    ]


type' ::
  forall r.
  SelectionSet r Fernet.Introspection.Schema.Types.Type ->
  SelectionSet ( type :: Record r ) Fernet.Introspection.Schema.Types.Field
type' (SelectionSet fields) = SelectionSet [ Composite "type" [] fields ]

isDeprecated :: SelectionSet ( isDeprecated :: Boolean ) Fernet.Introspection.Schema.Types.Field
isDeprecated = noArgs "isDeprecated"

deprecationReason :: SelectionSet ( deprecationReason :: Maybe String ) Fernet.Introspection.Schema.Types.Field
deprecationReason = noArgs "deprecationReason"
