module Dillonkearns.GraphQLClientGenerator.MakeModule.Subscription where

import Data.Array.NonEmpty (NonEmptyArray)
import Dillonkearns.GraphQLClientGenerator.IntrospectionSchema (InstorpectionQueryResult__Field)
import Dillonkearns.GraphQLClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import Language.PS.SmartCST

makeModule ::
  (String -> String) ->
  ModuleName ->
  NonEmptyArray String ->
  ModuleName ->
  Array InstorpectionQueryResult__Field ->
  Module
makeModule nameToScope scalarModule apiModuleName moduleName fields =
  Module
    { moduleName
    , exports: []
    , declarations: DeclarationsForFields.declarationsForFields { apiModuleName, scalarModule } nameToScope "RootSubscription" fields
    }
