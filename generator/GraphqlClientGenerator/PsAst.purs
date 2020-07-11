module GraphqlClientGenerator.PsAst where

import GraphqlClient.Utils
import GraphqlClientGenerator.IntrospectionSchema
import Language.PS.AST
import Language.PS.AST.Printers
import Language.PS.AST.Sugar
import Protolude

import Data.Array (filter)
import Data.Foldable (elem)
import Data.Map (Map)
import Data.Map (fromFoldable) as Map
import Data.NonEmpty ((:|))
import Data.String.Extra as StringsExtra
import Data.String.Utils (startsWith)
import GraphqlClientGenerator.IntrospectionSchema.TypeKind as TypeKind
import GraphqlClientGenerator.MakeModule.Enum as MakeModule.Enum
import GraphqlClientGenerator.MakeModule.Interface as MakeModule.Interface
import GraphqlClientGenerator.MakeModule.Scalar as MakeModule.Scalar
import GraphqlClientGenerator.MakeModule.Object as MakeModule.Object

type FilesMap =
  { dirs ::
    { "Enum" :: Map String String
    , "Object" :: Map String String
    -- | , "Interface" :: Map String String
    -- | , "Union" :: Map String String
    }
  , files ::
    { "Scalar" :: String
    }
  }
  -- | , "InputObject" :: String
  -- | , "Interface" :: String
  -- | , "Mutation" :: String
  -- | , "Object" :: String
  -- | , "Query" :: String
  -- | , "ScalarCodecs" :: String
  -- | , "Subscription" :: String
  -- | , "Union" :: String
  -- | , "VerifyScalarCodecs" :: String

isBuiltIn :: String -> Boolean
isBuiltIn = startsWith "__"

fullTypeToModuleMapItem :: (ModuleName -> InstorpectionQueryResult__FullType -> Module) -> String -> String -> InstorpectionQueryResult__FullType -> Tuple String String
fullTypeToModuleMapItem mkModule apiModuleName submodule fullType =
  let
    moduleName = mkModuleName $ apiModuleName :| [submodule, StringsExtra.pascalCase fullType.name]
   in submodule /\ (printModuleToString $ mkModule moduleName fullType)

builtInScalarNames :: Array String
builtInScalarNames =
    [ "Boolean"
    , "String"
    , "Int"
    , "Float"

    -- XXX:
    -- It's in spec starting from the first issue https://spec.graphql.org/July2015/#sec-ID and should always be a string
    -- Should we uncomment it?
    -- , "ID"
    ]

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
        <#> (fullTypeToModuleMapItem MakeModule.Enum.makeModule apiModuleName "Enum")
        # Map.fromFoldable
      , "Object":
        introspectionQueryResult.__schema.types
        # filter (\fullType -> fullType."kind" == TypeKind.Object)
        # filter (\fullType -> notExcluded fullType.name)
        <#> (fullTypeToModuleMapItem MakeModule.Object.makeModule apiModuleName "Object")
        # Map.fromFoldable
      -- | , "Interface":
      -- |   introspectionQueryResult.__schema.types
      -- |   # filter (\fullType -> fullType."kind" == TypeKind.Interface)
      -- |   # filter (\fullType -> notExcluded fullType.name)
      -- |   <#> (fullTypeToModuleMapItem MakeModule.Interface.makeModule apiModuleName "Interface")
      -- |   # Map.fromFoldable
      -- | , "Union":
      -- |   introspectionQueryResult.__schema.types
      -- |   # filter (\fullType -> fullType."kind" == TypeKind.Union)
      -- |   # filter (\fullType -> notExcluded fullType.name)
      -- |   <#> (fullTypeToModuleMapItem MakeModule.Interface.makeModule apiModuleName "Union")
      -- |   # Map.fromFoldable
      }
    , files:
      { "Scalar":
        let
          moduleName = mkModuleName $ apiModuleName :| ["Scalar"]

          scalarTypes :: Array InstorpectionQueryResult__FullType
          scalarTypes =
            introspectionQueryResult.__schema.types
            # filter (\fullType -> fullType."kind" == TypeKind.Scalar)
            # filter (\fullType -> not $ elem fullType.name builtInScalarNames)
        in printModuleToString $ MakeModule.Scalar.makeModule moduleName scalarTypes
      }
    }
