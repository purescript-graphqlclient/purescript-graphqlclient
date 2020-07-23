module GraphqlClientGenerator.MakeModule.Mutation where

import Data.Array.NonEmpty (NonEmptyArray)
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__Field)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields

import Language.PS.SmartCST

makeModule
  :: (String -> String)
  -> ModuleName
  -> NonEmptyArray String
  -> Array String
  -> Array String
  -> Array String
  -> Array String
  -> ModuleName
  -> Array InstorpectionQueryResult__Field
  -> Module
makeModule
  nameToScope
  scalarModule
  apiModuleName
  instorpectionMutationResult__FullType__enum_names
  instorpectionMutationResult__FullType__interface_names
  instorpectionMutationResult__FullType__object_names
  instorpectionMutationResult__FullType__union_names
  moduleName
  fields = Module
  { moduleName
  , exports: []
  , declarations: DeclarationsForFields.declarationsForFields { apiModuleName, scalarModule } nameToScope "RootMutation" fields
  }
