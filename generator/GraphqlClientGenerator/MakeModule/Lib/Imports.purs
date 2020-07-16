module GraphqlClientGenerator.MakeModule.Lib.Imports where

import Protolude
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Language.PS.CST (ImportDecl(..))
import Language.PS.CST.Sugar (mkModuleName)

imports :: NonEmptyArray String -> Array ImportDecl
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
    { moduleName: mkModuleName $ apiModuleName <> NonEmpty.singleton "InputObject"
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ NonEmpty.cons' "Type" ["Row"]
    , names: []
    , qualification: Nothing
    }
  ]
