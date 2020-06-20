module Generator.PsAst where

import Fernet.Introspection.IntrospectionSchema
import Fernet.Introspection.Schema.TypeKind
import Language.PS.AST
import Language.PS.AST.Printers
import Language.PS.AST.Sugar
import Protolude
import Utils
import Generator.PsAst.MkEnumModule

import Data.Array (filter)
import Data.Functor.Mu (roll)
import Data.List ((:))
import Data.List (fromFoldable) as List
import Data.Map (Map)
import Data.Map (empty, fromFoldable) as Map
import Data.NonEmpty ((:|))
import Data.Predicate (Predicate(..))
import Data.String.Utils (startsWith)
import Fernet.Introspection.Schema.Fields (__schema)
import Data.String.Extra as StringsExtra

type FilesMap =
  { dirs ::
    { "Enum" :: Map ModuleName String
    , "Interface" :: Map String String
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

isBuiltIn :: String -> Boolean
isBuiltIn = startsWith "__"

fullTypeToModule apiModuleName submodule fullType =
  let
    moduleName = mkModuleName $ apiModuleName :| [submodule, StringsExtra.pascalCase fullType.name]
   in moduleName /\ (printModuleToString $ mkEnumModule moduleName fullType)

-- typeLockDefinitions - Union, Object, Interface
mkFilesMap :: String -> InstorpectionQueryResult -> FilesMap
mkFilesMap apiModuleName introspectionQueryResult =
  let
    excludeQuery name        = introspectionQueryResult.__schema.queryType.name == name
    excludeMutation name     = introspectionQueryResult.__schema.mutationType # maybe true (\type_ -> type_.name == name)
    excludeSubscription name = introspectionQueryResult.__schema.subscriptionType # maybe true (\type_ -> type_.name == name)
    excludeBuiltIn           = isBuiltIn

    notExcluded = not $ anyPredicate [excludeQuery, excludeMutation, excludeSubscription, excludeBuiltIn]
  in
    { dirs:
      { "Enum":
        introspectionQueryResult.__schema.types
        # filter (\fullType -> fullType."kind" == Enum)
        # filter (\fullType -> notExcluded fullType.name)
        <#> (fullTypeToModule apiModuleName "Enum")
        # Map.fromFoldable
      }
    }
