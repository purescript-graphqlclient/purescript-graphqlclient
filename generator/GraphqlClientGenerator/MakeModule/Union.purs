module GraphqlClientGenerator.MakeModule.Union where

import Protolude

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Fragments as Fragments
import GraphqlClientGenerator.MakeModule.Lib.Imports as Imports
import GraphqlClientGenerator.MakeModule.Lib.Utils (declDataWithoutConstructors)
import Language.PS.CST (ImportDecl(..), Module(..), ModuleName)
import Language.PS.CST.Sugar (mkModuleName)

makeModule :: (String -> String) -> ImportDecl -> NonEmptyArray String -> Array String -> ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule nameToScope importScalar apiModuleName instorpectionQueryResult__FullType__enum_names moduleName fullType = Module
  { moduleName
  , imports:
      Imports.imports apiModuleName <>
      [ ImportDecl
        { moduleName: mkModuleName $ apiModuleName <> NonEmpty.singleton "Scopes"
        , names: []
        , qualification: Nothing
        }
      , importScalar
      ] <>
      (instorpectionQueryResult__FullType__enum_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ apiModuleName <> NonEmpty.cons' "Enum" [name]
          , names: []
          , qualification: Nothing
          }
        )
      )
  , exports: []
  , declarations:
    DeclarationsForFields.declarationsForFields nameToScope fullType.name (fromMaybe [] fullType.fields) <>
    Fragments.declarationForPossibleTypes nameToScope fullType.name (fromMaybe [] fullType.possibleTypes)
  }
