module GraphqlClientGenerator.MakeModule.Interface where

import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import GraphqlClientGenerator.MakeModule.Lib.Utils (declDataWithoutConstructors, scopeName)
import Language.PS.CST (ImportDecl(..), Module(..), ModuleName)
import Language.PS.CST.Sugar (mkModuleName)
import Protolude (Maybe(..), fromMaybe, ($), (<#>), (<>))

import Data.Array.NonEmpty as NonEmpty
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Imports as Imports

makeModule :: String -> Array String -> ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule apiModuleName instorpectionQueryResult__FullType__enum_names moduleName fullType =
    Module
    { moduleName
    , imports:
        Imports.imports apiModuleName <>
        (instorpectionQueryResult__FullType__enum_names <#>
          (\name -> ImportDecl
            { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["Enum", name]
            , names: []
            , qualification: Nothing
            }
          )
        )
    , exports: []
    , declarations: [declDataWithoutConstructors (scopeName fullType.name)] <> DeclarationsForFields.declarationsForFields fullType.name (fromMaybe [] fullType.fields)
    }