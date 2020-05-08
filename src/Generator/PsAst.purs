module Generator.PsAst where

import Language.PS.AST
import Protolude

import Data.Functor.Mu (roll)
import Data.List (fromFoldable) as List
import Data.Map (Map)
import Data.Map (empty, fromFoldable) as Map
import Language.PS.AST.Printers as Language.PS.AST.Printers

enumsModule :: Module
enumsModule = Module
  { moduleName: ModuleName "Api.Enums"
  , declarations: List.fromFoldable
    [ DeclType { typeName: TypeName "Episode", "type": roll $ TypeRecord (Row { labels: Map.empty, tail: Just (Left $ Ident "Asdf") }), vars: [] }
    ]
  }

type FilesMap =
  { dirs ::
    { "Enum" :: Map String String
    -- , "Interface" :: Map String String
    -- , "Object" :: Map String String
    -- , "Union" :: Map String String
    }
  -- , files ::
  --   { "InputObject" :: String
  --   , "Interface" :: String
  --   , "Mutation" :: String
  --   , "Object" :: String
  --   , "Query" :: String
  --   , "Scalar" :: String
  --   , "ScalarCodecs" :: String
  --   , "Subscription" :: String
  --   , "Union" :: String
  --   , "VerifyScalarCodecs" :: String
  --   }
  }

filesMap :: FilesMap
filesMap =
  { dirs:
    { "Enum": Map.fromFoldable
      [ "Episode" /\ Language.PS.AST.Printers.printModule enumsModule
      ]
    }
  }
