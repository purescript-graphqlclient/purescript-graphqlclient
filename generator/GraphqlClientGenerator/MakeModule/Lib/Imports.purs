module GraphqlClientGenerator.MakeModule.Lib.Imports where

import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import Language.PS.CST
import Language.PS.CST.Sugar
import Protolude

import Data.Array as Array
import Data.List ((:))
import Data.List as List
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra

imports :: String -> Array ImportDecl
imports apiModuleName =
  [ ImportDecl
    { moduleName: mkModuleName $ NonEmpty.singleton "Prelude"
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ NonEmpty.singleton "GraphqlClient"
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ NonEmpty.cons' "Data" ["Maybe"]
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["Scalar"]
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["InputObject"]
    , names: []
    , qualification: Nothing
    }
  ]
