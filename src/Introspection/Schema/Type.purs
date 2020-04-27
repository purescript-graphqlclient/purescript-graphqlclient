module Fernet.Introspection.Schema.Type where

import Prelude
import Data.Maybe (Maybe)
import Fernet.GraphQL.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), SelectionSet(..), noArgs)
import Fernet.Introspection.Schema.Types as Types
import Fernet.Introspection.Schema.TypeKind as TypeKind

kind :: SelectionSet ( kind :: TypeKind.TypeKind ) Types.Type
kind = noArgs "kind"

name :: SelectionSet ( name :: Maybe String ) Types.Type
name = noArgs "name"

description :: SelectionSet ( description :: String ) Types.Type
description = noArgs "description"

fields ::
  forall r.
  Maybe Boolean ->
  SelectionSet r Types.Field ->
  SelectionSet ( fields :: Maybe (Array (Record r)) ) Types.Type
fields includeDeprecated (SelectionSet fields') =
  SelectionSet
    [ Composite
        "fields"
        [ OptionalArgument
            "includeDeprecated"
            (ArgBoolean <$> includeDeprecated)
        ]
        fields'
    ]


interfaces ::
  forall r.
  SelectionSet r Types.Type ->
  SelectionSet ( interfaces :: Array (Record r) ) Types.Type
interfaces (SelectionSet fields') =
  SelectionSet
    [ Composite "interfaces" [] fields' ]


possibleTypes ::
  forall r.
  SelectionSet r Types.Type ->
  SelectionSet ( possibleTypes :: Array (Record r) ) Types.Type
possibleTypes (SelectionSet fields') =
  SelectionSet
    [ Composite "possibleTypes" [] fields' ]


enumValues ::
  forall r.
  Maybe Boolean ->
  SelectionSet r Types.EnumValue ->
  SelectionSet ( enumValues :: Array (Record r) ) Types.Type
enumValues includeDeprecated (SelectionSet fields') =
  SelectionSet
    [ Composite
        "enumValues"
        [ OptionalArgument
            "includeDeprecated"
            (ArgBoolean <$> includeDeprecated)
        ]
        fields'
    ]


inputFields ::
  forall r.
  SelectionSet r Types.InputValue ->
  SelectionSet ( inputFields :: Array (Record r) ) Types.Type
inputFields (SelectionSet fields') = SelectionSet [ Composite "inputFields" [] fields' ]

ofType ::
  forall r.
  SelectionSet r Types.Type ->
  SelectionSet ( ofType :: Record r ) Types.Type
ofType (SelectionSet fields') = SelectionSet [ Composite "ofType" [] fields' ]
