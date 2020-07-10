module GraphqlClientGenerator.PsAst where

import GraphqlClientGenerator.Introspection.IntrospectionSchema
import GraphqlClientGenerator.Introspection.Schema.TypeKind as TypeKind
import GraphqlClientGenerator.PsAst.MkEnumModule as MkEnumModule
import GraphqlClientGenerator.PsAst.MkInterfaceModule as MkInterfaceModule
import Language.PS.AST
import Language.PS.AST.Printers
import Language.PS.AST.Sugar
import Protolude
import GraphqlClient.Utils

import Data.Array (filter)
import Data.Functor.Mu (roll)
import Data.List ((:))
import Data.List (fromFoldable) as List
import Data.Map (Map)
import Data.Map (empty, fromFoldable) as Map
import Data.NonEmpty ((:|))
import Data.Predicate (Predicate(..))
import Data.String.Utils (startsWith)
import GraphqlClientGenerator.Introspection.Schema.Fields (__schema)
import Data.String.Extra as StringsExtra

type FilesMap =
  { dirs ::
    { "Enum" :: Map ModuleName String
    -- | , "Interface" :: Map ModuleName String
    -- | , "Object" :: Map ModuleName String
    -- | , "Union" :: Map ModuleName String
    }
  -- | , files ::
  -- |   { "Query" :: String
  -- |   }
  }
  -- | , "InputObject" :: String
  -- | , "Interface" :: String
  -- | , "Mutation" :: String
  -- | , "Object" :: String
  -- | , "Scalar" :: String
  -- | , "ScalarCodecs" :: String
  -- | , "Subscription" :: String
  -- | , "Union" :: String
  -- | , "VerifyScalarCodecs" :: String

isBuiltIn :: String -> Boolean
isBuiltIn = startsWith "__"

fullTypeToModule :: (ModuleName -> InstorpectionQueryResult__FullType -> Module) -> String -> String -> InstorpectionQueryResult__FullType -> Tuple ModuleName String
fullTypeToModule mkModule apiModuleName submodule fullType =
  let
    moduleName = mkModuleName $ apiModuleName :| [submodule, StringsExtra.pascalCase fullType.name]
   in moduleName /\ (printModuleToString $ mkModule moduleName fullType)

-- typeLockDefinitions - Union, Object, Interface
mkFilesMap :: String -> InstorpectionQueryResult -> FilesMap
mkFilesMap apiModuleName introspectionQueryResult =
  let
    excludeQuery name        = introspectionQueryResult.__schema.queryType.name == name
    excludeMutation name     = introspectionQueryResult.__schema.mutationType # maybe true (\type_ -> type_.name == name)
    excludeSubscription name = introspectionQueryResult.__schema.subscriptionType # maybe true (\type_ -> type_.name == name)
    excludeBuiltIn           = isBuiltIn

    notExcluded = not $ anyPredicate [excludeQuery, excludeMutation, excludeSubscription, excludeBuiltIn]

    -- | query :: Array { name :: String, description :: String, args :: Array InstorpectionQueryResult__InputValue }
    -- | query = ?a
  in
    { dirs:
      { "Enum":
        introspectionQueryResult.__schema.types
        # filter (\fullType -> fullType."kind" == TypeKind.Enum)
        # filter (\fullType -> notExcluded fullType.name)
        <#> (fullTypeToModule MkEnumModule.mkEnumModule apiModuleName "Enum")
        # Map.fromFoldable
      -- | , "Interface":
      -- |   introspectionQueryResult.__schema.types
      -- |   # filter (\fullType -> fullType."kind" == TypeKind.Interface)
      -- |   # filter (\fullType -> notExcluded fullType.name)
      -- |   <#> (fullTypeToModule MkInterfaceModule.mkInterfaceModule apiModuleName "Interface")
      -- |   # Map.fromFoldable
      -- | , "Object":
      -- |   introspectionQueryResult.__schema.types
      -- |   # filter (\fullType -> fullType."kind" == TypeKind.Object)
      -- |   # filter (\fullType -> notExcluded fullType.name)
      -- |   <#> (fullTypeToModule MkInterfaceModule.mkInterfaceModule apiModuleName "Object")
      -- |   # Map.fromFoldable
      -- | , "Union":
      -- |   introspectionQueryResult.__schema.types
      -- |   # filter (\fullType -> fullType."kind" == TypeKind.Union)
      -- |   # filter (\fullType -> notExcluded fullType.name)
      -- |   <#> (fullTypeToModule MkInterfaceModule.mkInterfaceModule apiModuleName "Union")
      -- |   # Map.fromFoldable
      }
    }
