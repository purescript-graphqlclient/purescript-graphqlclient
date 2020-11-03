module GraphQLClientGenerator.MakeModule.Query where

import Data.Array.NonEmpty (NonEmptyArray)
import GraphQLClientGenerator.IntrospectionSchema (InstorpectionQueryResult__Field)
import GraphQLClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import Language.PS.SmartCST

makeModule ::
  (String -> String) ->
  ModuleName ->
  NonEmptyArray String ->
  Array String ->
  Array String ->
  Array String ->
  Array String ->
  ModuleName ->
  Array InstorpectionQueryResult__Field ->
  Module
makeModule nameToScope scalarModule apiModuleName instorpectionQueryResult__FullType__enum_names instorpectionQueryResult__FullType__interface_names instorpectionQueryResult__FullType__object_names instorpectionQueryResult__FullType__union_names moduleName fields =
  Module
    { moduleName
    , exports: []
    , declarations: DeclarationsForFields.declarationsForFields { apiModuleName, scalarModule } nameToScope "RootQuery" fields
    }
