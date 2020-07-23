module GraphqlClientGenerator.MakeModule.Interface where

import Protolude

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Fragments as Fragments

import GraphqlClientGenerator.MakeModule.Lib.Utils (declDataWithoutConstructors)
import Language.PS.SmartCST
import Language.PS.SmartCST

makeModule
  :: (String -> String)
  -> ModuleName
  -> NonEmptyArray String
  -> Array String
  -> ModuleName
  -> InstorpectionQueryResult__FullType
  -> Module
makeModule nameToScope scalarModule apiModuleName instorpectionQueryResult__FullType__enum_names moduleName fullType =
  Module
  { moduleName
  , exports: []
  , declarations:
    DeclarationsForFields.declarationsForFields { apiModuleName, scalarModule } nameToScope fullType.name (fromMaybe [] fullType.fields) <>
    Fragments.declarationForPossibleTypes apiModuleName nameToScope fullType.name (fromMaybe [] fullType.possibleTypes)
  }
