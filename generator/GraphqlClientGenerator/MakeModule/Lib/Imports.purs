module GraphqlClientGenerator.MakeModule.Lib.Imports where

import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import Language.PS.AST
import Language.PS.AST.Sugar
import Protolude

import Data.Array as Array
import Data.List ((:))
import Data.List as List
import Data.NonEmpty ((:|))
import Data.String.Extra as StringsExtra

imports :: String -> Array ImportDecl
imports apiModuleName =
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
  , ImportDecl
    { moduleName: mkModuleName $ "Data" :| ["Maybe"]
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ apiModuleName :| ["Scalar"]
    , names: []
    , qualification: Nothing
    }
  ]
