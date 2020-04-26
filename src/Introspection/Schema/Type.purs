module Fernet.Introspection.Schema.Type where

import Prelude
import Data.Maybe (Maybe)
import Fernet.GraphQL.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), SelectionSet(..), noArgs)
import Fernet.Introspection.Schema.Types (EnumValue, Field, InputValue, Type, TypeKind)

kind :: SelectionSet ( kind :: TypeKind ) Type
kind = noArgs "kind"

name :: SelectionSet ( name :: Maybe String ) Type
name = noArgs "name"

description :: SelectionSet ( description :: String ) Type
description = noArgs "description"

fields ::
  forall r.
  Maybe Boolean ->
  SelectionSet r Field ->
  SelectionSet ( fields :: Maybe (Array (Record r)) ) Type
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
  SelectionSet r Type ->
  SelectionSet ( interfaces :: Array (Record r) ) Type
interfaces (SelectionSet fields') =
  SelectionSet
    [ Composite "interfaces" [] fields' ]


possibleTypes ::
  forall r.
  SelectionSet r Type ->
  SelectionSet ( possibleTypes :: Array (Record r) ) Type
possibleTypes (SelectionSet fields') =
  SelectionSet
    [ Composite "possibleTypes" [] fields' ]


enumValues ::
  forall r.
  Maybe Boolean ->
  SelectionSet r EnumValue ->
  SelectionSet ( enumValues :: Array (Record r) ) Type
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
  SelectionSet r InputValue ->
  SelectionSet ( inputFields :: Array (Record r) ) Type
inputFields (SelectionSet fields') = SelectionSet [ Composite "inputFields" [] fields' ]

ofType ::
  forall r.
  SelectionSet r Type ->
  SelectionSet ( ofType :: Record r ) Type
ofType (SelectionSet fields') = SelectionSet [ Composite "ofType" [] fields' ]
