module GraphqlClientGenerator.MakeModule.Query where

import Language.PS.CST
import Language.PS.CST.Sugar
import Protolude

import Data.Array as Array
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Imports as Imports
import GraphqlClientGenerator.MakeModule.Lib.Utils

makeModule
  :: String
  -> Array String
  -> Array String
  -> Array String
  -> Array String
  -> ModuleName
  -> Array InstorpectionQueryResult__Field
  -> Module
makeModule
  apiModuleName
  instorpectionQueryResult__FullType__enum_names
  instorpectionQueryResult__FullType__interface_names
  instorpectionQueryResult__FullType__object_names
  instorpectionQueryResult__FullType__union_names
  moduleName
  fields = Module
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
      ) <>
        (instorpectionQueryResult__FullType__interface_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["Interface", name]
          , names: []
          , qualification: Nothing
          }
        )
      ) <>
        (instorpectionQueryResult__FullType__object_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["Object", name]
          , names: []
          , qualification: Nothing
          }
        )
      ) <>
        (instorpectionQueryResult__FullType__union_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["Union", name]
          , names: []
          , qualification: Nothing
          }
        )
      )
  , exports: []
  , declarations: DeclarationsForFields.declarationsForFields "RootQuery" fields
  }
