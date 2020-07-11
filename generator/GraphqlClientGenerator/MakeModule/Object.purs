module GraphqlClientGenerator.MakeModule.Object where

import Protolude
import Language.PS.AST
import Language.PS.AST.Sugar

import Data.NonEmpty ((:|))
import Data.Array as Array
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)

makeModule :: ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule moduleName fullType = Module
  { moduleName
  , imports:
    [ ImportDecl
      { moduleName: mkModuleName $ "Prelude" :| []
      , names: []
      , qualification: Nothing
      }
    , ImportDecl
      { moduleName: mkModuleName $ "GraphqlClient" :| []
      , names: []
      , qualification: Nothing
      }
    ]
  , exports: []
  , declarations:
    [ DeclData
      { comments: Nothing
      , head: DataHead
          { dataHdName: ProperName $ "Scope__" <> StringsExtra.pascalCase fullType.name
          , dataHdVars: []
          }
      , constructors: []
      }
    ]
  }
