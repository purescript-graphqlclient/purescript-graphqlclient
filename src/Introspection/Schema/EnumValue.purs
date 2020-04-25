module Fernet.Introspection.Schema.EnumValue where

import Data.Maybe (Maybe)
import Fernet.GraphQL.SelectionSet (SelectionSet, noArgs)
import Fernet.Introspection.Schema.Types (EnumValue)

name :: SelectionSet ( name :: String ) EnumValue
name = noArgs "name"

description :: SelectionSet ( description :: Maybe String ) EnumValue
description = noArgs "description"

isDeprecated :: SelectionSet ( isDeprecated :: Boolean ) EnumValue
isDeprecated = noArgs "isDeprecated"

deprecationReason :: SelectionSet ( deprecationReason :: Maybe String ) EnumValue
deprecationReason = noArgs "deprecationReason"
