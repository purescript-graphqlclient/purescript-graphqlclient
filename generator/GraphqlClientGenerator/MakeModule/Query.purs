module GraphqlClientGenerator.MakeModule.Query where

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__Field)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Imports as Imports
import Language.PS.CST (ImportDecl(..), Module(..), ModuleName)
import Language.PS.CST.Sugar (mkModuleName)
import Protolude (Maybe(..), ($), (<#>), (<>))

makeModule
  :: ImportDecl
  -> NonEmptyArray String
  -> Array String
  -> Array String
  -> Array String
  -> Array String
  -> ModuleName
  -> Array InstorpectionQueryResult__Field
  -> Module
makeModule
  importScalar
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
          { moduleName: mkModuleName $ apiModuleName <> NonEmpty.cons' "Enum" [name]
          , names: []
          , qualification: Nothing
          }
        )
      ) <>
      [ ImportDecl
        { moduleName: mkModuleName $ apiModuleName <> NonEmpty.singleton "Scopes"
        , names: []
        , qualification: Nothing
        }
      , importScalar
      ]
  , exports: []
  , declarations: DeclarationsForFields.declarationsForFields "RootQuery" fields
  }
