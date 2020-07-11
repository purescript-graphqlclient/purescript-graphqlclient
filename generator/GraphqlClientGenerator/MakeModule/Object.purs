module GraphqlClientGenerator.MakeModule.Object where

import Language.PS.AST
import Language.PS.AST.Sugar
import Protolude

import Data.Array as Array
import Data.NonEmpty ((:|))
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Imports as Imports
import GraphqlClientGenerator.MakeModule.Lib.Utils

makeModule :: String -> Array String -> Array String -> ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule apiModuleName instorpectionQueryResult__FullType__enum_names instorpectionQueryResult__FullType__interface_names moduleName fullType = Module
  { moduleName
  , imports:
      Imports.imports apiModuleName <>
      (instorpectionQueryResult__FullType__enum_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ apiModuleName :| ["Enum", name]
          , names: []
          , qualification: Nothing
          }
        )
      ) <>
        (instorpectionQueryResult__FullType__interface_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ apiModuleName :| ["Interface", name]
          , names: []
          , qualification: Nothing
          }
        )
      )
  , exports: []
  , declarations: [declDataWithoutConstructors (scopeName fullType.name)] <> DeclarationsForFields.declarationsForFields fullType.name (fromMaybe [] fullType.fields)
  }
