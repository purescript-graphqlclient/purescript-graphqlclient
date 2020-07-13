module GraphqlClientGenerator.PsCst where

import GraphqlClient.Utils (anyPredicate)
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult, InstorpectionQueryResult__Field, InstorpectionQueryResult__FullType)
import Language.PS.CST (Module, ModuleName)
import Language.PS.CST.Printers (printModuleToString)
import Language.PS.CST.Sugar (mkModuleName)
import Protolude

import Data.Array as Array
import Data.Foldable (elem)
import Data.Map (Map)
import Data.Map as Map
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra
import Data.String.Utils as String
import GraphqlClientGenerator.IntrospectionSchema.TypeKind as TypeKind
import GraphqlClientGenerator.MakeModule.Enum as MakeModule.Enum
import GraphqlClientGenerator.MakeModule.Interface as MakeModule.Interface
import GraphqlClientGenerator.MakeModule.Object as MakeModule.Object
import GraphqlClientGenerator.MakeModule.Query as MakeModule.Query
import GraphqlClientGenerator.MakeModule.Scalar as MakeModule.Scalar
import GraphqlClientGenerator.MakeModule.Union as MakeModule.Union
import GraphqlClientGenerator.MakeModule.InputObject as MakeModule.InputObject

type FilesMap =
  { dirs ::
    { "Enum" :: Map String String
    , "Object" :: Map String String
    , "Interface" :: Map String String
    , "Union" :: Map String String
    }
  , files ::
    { "Scalar" :: String
    , "Query" :: String
    , "InputObject" :: String
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
isBuiltIn = String.startsWith "__"

fullTypeToModuleMapItem :: (ModuleName -> InstorpectionQueryResult__FullType -> Module) -> String -> String -> InstorpectionQueryResult__FullType -> Tuple String String
fullTypeToModuleMapItem mkModule apiModuleName submodule fullType =
  let
    name = StringsExtra.pascalCase fullType.name
    moduleName = mkModuleName $ NonEmpty.cons' apiModuleName [submodule, name]
   in name /\ (printModuleToString $ mkModule moduleName fullType)

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

    onlyTypesWithoutExcluded :: TypeKind.TypeKind -> Array InstorpectionQueryResult__FullType
    onlyTypesWithoutExcluded typeKind =
      introspectionQueryResult.__schema.types
      # Array.filter (\fullType -> fullType."kind" == typeKind)
      # Array.filter (\fullType -> notExcluded fullType.name)

    instorpectionQueryResult__FullType__enum :: Array InstorpectionQueryResult__FullType
    instorpectionQueryResult__FullType__enum = onlyTypesWithoutExcluded TypeKind.Enum

    instorpectionQueryResult__FullType__enum_names :: Array String
    instorpectionQueryResult__FullType__enum_names = instorpectionQueryResult__FullType__enum <#> _.name <#> StringsExtra.pascalCase

    instorpectionQueryResult__FullType__interface :: Array InstorpectionQueryResult__FullType
    instorpectionQueryResult__FullType__interface = onlyTypesWithoutExcluded TypeKind.Interface

    instorpectionQueryResult__FullType__interface_names :: Array String
    instorpectionQueryResult__FullType__interface_names = instorpectionQueryResult__FullType__interface <#> _.name <#> StringsExtra.pascalCase

    instorpectionQueryResult__FullType__object :: Array InstorpectionQueryResult__FullType
    instorpectionQueryResult__FullType__object = onlyTypesWithoutExcluded TypeKind.Object

    instorpectionQueryResult__FullType__object_names :: Array String
    instorpectionQueryResult__FullType__object_names = instorpectionQueryResult__FullType__object <#> _.name <#> StringsExtra.pascalCase

    instorpectionQueryResult__FullType__union :: Array InstorpectionQueryResult__FullType
    instorpectionQueryResult__FullType__union = onlyTypesWithoutExcluded TypeKind.Union

    instorpectionQueryResult__FullType__union_names :: Array String
    instorpectionQueryResult__FullType__union_names = instorpectionQueryResult__FullType__union <#> _.name <#> StringsExtra.pascalCase
  in
    { dirs:
      { "Enum":
        instorpectionQueryResult__FullType__enum
        <#> (fullTypeToModuleMapItem MakeModule.Enum.makeModule apiModuleName "Enum")
        # Map.fromFoldable
      , "Object":
        instorpectionQueryResult__FullType__object
        <#> (fullTypeToModuleMapItem (MakeModule.Object.makeModule apiModuleName instorpectionQueryResult__FullType__enum_names instorpectionQueryResult__FullType__interface_names) apiModuleName "Object")
        # Map.fromFoldable
      , "Interface":
        instorpectionQueryResult__FullType__interface
        <#> (fullTypeToModuleMapItem (MakeModule.Interface.makeModule apiModuleName instorpectionQueryResult__FullType__enum_names) apiModuleName "Interface")
        # Map.fromFoldable
      , "Union":
        onlyTypesWithoutExcluded TypeKind.Union
        <#> (fullTypeToModuleMapItem (MakeModule.Union.makeModule apiModuleName instorpectionQueryResult__FullType__enum_names) apiModuleName "Union")
        # Map.fromFoldable
      }
    , files:
      { "Scalar":
        let
          moduleName = mkModuleName $ NonEmpty.cons' apiModuleName ["Scalar"]

          scalarTypes :: Array InstorpectionQueryResult__FullType
          scalarTypes =
            introspectionQueryResult.__schema.types
            # Array.filter (\fullType -> fullType."kind" == TypeKind.Scalar)
            # Array.filter (\fullType -> not $ elem fullType.name builtInScalarNames)
        in printModuleToString $ MakeModule.Scalar.makeModule moduleName scalarTypes
      , "InputObject":
        let
          moduleName = mkModuleName $ NonEmpty.cons' apiModuleName ["InputObject"]

          inputObjectTypes :: Array InstorpectionQueryResult__FullType
          inputObjectTypes =
            introspectionQueryResult.__schema.types
            # Array.filter (\fullType -> fullType."kind" == TypeKind.InputObject)
            # Array.filter (\fullType -> not $ elem fullType.name builtInScalarNames)
         in printModuleToString $ MakeModule.InputObject.makeModule apiModuleName moduleName inputObjectTypes instorpectionQueryResult__FullType__enum_names
      , "Query":
        let
          moduleName = mkModuleName $ NonEmpty.cons' apiModuleName ["Query"]

          queryType :: Maybe InstorpectionQueryResult__FullType
          queryType = Array.find (\x -> x.name == introspectionQueryResult.__schema.queryType.name) introspectionQueryResult.__schema.types

          queryFields :: Array InstorpectionQueryResult__Field
          queryFields = maybe [] (\x -> fromMaybe [] x.fields) queryType
         in
          printModuleToString $
            MakeModule.Query.makeModule
            apiModuleName
            instorpectionQueryResult__FullType__enum_names
            instorpectionQueryResult__FullType__interface_names
            instorpectionQueryResult__FullType__object_names
            instorpectionQueryResult__FullType__union_names
            moduleName
            queryFields
      }
    }
