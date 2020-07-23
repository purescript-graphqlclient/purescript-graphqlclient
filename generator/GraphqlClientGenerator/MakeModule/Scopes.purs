module GraphqlClientGenerator.MakeModule.Scopes where

import Data.Array.NonEmpty (NonEmptyArray)

import GraphqlClientGenerator.MakeModule.Lib.Utils (declDataWithoutConstructors)
import Language.PS.SmartCST
import Protolude ((<#>), (<>))

makeModule :: (String -> String) -> NonEmptyArray String -> Array String -> Array String -> Array String -> ModuleName -> Module
makeModule
  nameToScope
  apiModuleName
  instorpectionQueryResult__FullType__interface_names
  instorpectionQueryResult__FullType__object_names
  instorpectionQueryResult__FullType__union_names
  moduleName
  = Module
  { moduleName
  , exports: []
  , declarations:
    (instorpectionQueryResult__FullType__object_names <#> \name -> declDataWithoutConstructors (nameToScope name)) <>
    (instorpectionQueryResult__FullType__interface_names <#> \name -> declDataWithoutConstructors (nameToScope name)) <>
    (instorpectionQueryResult__FullType__union_names <#> \name -> declDataWithoutConstructors (nameToScope name))
  }
