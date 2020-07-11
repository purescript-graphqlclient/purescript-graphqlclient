module GraphqlClientGenerator.MakeModule.Union where

import Language.PS.AST
import Language.PS.AST.Sugar
import Protolude

import Data.Array as Array
import Data.NonEmpty ((:|))
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import GraphqlClientGenerator.MakeModule.Lib.WithScopeAndFields as WithScopeAndFields

makeModule :: String -> Array String -> ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule apiModuleName instorpectionQueryResult__FullType__enum_names moduleName fullType = Module
  { moduleName
  , imports:
      WithScopeAndFields.imports apiModuleName <>
      (instorpectionQueryResult__FullType__enum_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ apiModuleName :| ["Enum", name]
          , names: []
          , qualification: Nothing
          }
        )
      )
  , exports: []
  , declarations: WithScopeAndFields.declarations fullType
  }
