module GraphqlClientGenerator.MakeModule.Union where

import Protolude

import Data.Array.NonEmpty (NonEmptyArray)
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Fragments as Fragments

import Language.PS.SmartCST (Module(..), ModuleName)

makeModule :: (String -> String) -> ModuleName -> NonEmptyArray String -> Array String -> ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule nameToScope scalarModule apiModuleName instorpectionQueryResult__FullType__enum_names moduleName fullType = Module
  { moduleName
  , exports: []
  , declarations:
    DeclarationsForFields.declarationsForFields { apiModuleName, scalarModule } nameToScope fullType.name (fromMaybe [] fullType.fields) <>
    Fragments.declarationForPossibleTypes apiModuleName nameToScope fullType.name (fromMaybe [] fullType.possibleTypes)
  }
