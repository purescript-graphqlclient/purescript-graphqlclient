module GraphqlClientGenerator.MakeModule.Union where

import Protolude
import Language.PS.CST (ImportDecl(..), Module(..), ModuleName)
import Language.PS.CST.Sugar (mkModuleName)

import Data.Array.NonEmpty as NonEmpty
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Imports as Imports
import GraphqlClientGenerator.MakeModule.Lib.Utils (declDataWithoutConstructors, scopeName)
import GraphqlClientGenerator.MakeModule.Lib.Fragments as Fragments

makeModule :: String -> Array String -> ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule apiModuleName instorpectionQueryResult__FullType__enum_names moduleName fullType = Module
  { moduleName
  , imports:
      Imports.imports apiModuleName <>
      [ ImportDecl
        { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["Scopes"]
        , names: []
        , qualification: Nothing
        }
      ] <>
      (instorpectionQueryResult__FullType__enum_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["Enum", name]
          , names: []
          , qualification: Nothing
          }
        )
      )
  , exports: []
  , declarations:
    DeclarationsForFields.declarationsForFields fullType.name (fromMaybe [] fullType.fields) <>
    Fragments.declarationForPossibleTypes fullType.name (fromMaybe [] fullType.possibleTypes)
  }
