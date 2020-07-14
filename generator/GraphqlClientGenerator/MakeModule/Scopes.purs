module GraphqlClientGenerator.MakeModule.Scopes where

import Language.PS.CST (ImportDecl(..), Module(..), ModuleName)
import Language.PS.CST.Sugar (mkModuleName)
import Protolude (Maybe(..), fromMaybe, ($), (<#>), (<>))

import Data.Array.NonEmpty as NonEmpty
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import GraphqlClientGenerator.MakeModule.Lib.Imports as Imports
import GraphqlClientGenerator.MakeModule.Lib.Utils (declDataWithoutConstructors, scopeName)

makeModule :: String -> Array String -> Array String -> Array String -> ModuleName -> Module
makeModule
  apiModuleName
  instorpectionQueryResult__FullType__interface_names
  instorpectionQueryResult__FullType__object_names
  instorpectionQueryResult__FullType__union_names
  moduleName
  = Module
  { moduleName
  , imports: []
  , exports: []
  , declarations:
    (instorpectionQueryResult__FullType__object_names <#> \name -> declDataWithoutConstructors (scopeName name)) <>
    (instorpectionQueryResult__FullType__interface_names <#> \name -> declDataWithoutConstructors (scopeName name)) <>
    (instorpectionQueryResult__FullType__union_names <#> \name -> declDataWithoutConstructors (scopeName name))
  }
