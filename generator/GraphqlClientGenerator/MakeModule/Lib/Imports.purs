module GraphqlClientGenerator.MakeModule.Lib.Imports where

import Language.PS.CST (ImportDecl(..))
import Language.PS.CST.Sugar (mkModuleName)
import Protolude (Maybe(..), ($))

import Data.Array.NonEmpty as NonEmpty

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
