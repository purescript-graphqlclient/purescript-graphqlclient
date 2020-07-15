module GraphqlClientGenerator.PsCst where

import Protolude

import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.Foldable (elem)
import Data.Map (Map)
import Data.Map as Map
import Data.String.Extra as StringsExtra
import Data.String.Utils as String
import GraphqlClient.Utils (anyPredicate)
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult, InstorpectionQueryResult__Field, InstorpectionQueryResult__FullType)
import GraphqlClientGenerator.IntrospectionSchema.TypeKind as TypeKind
import GraphqlClientGenerator.MakeModule.Enum as MakeModule.Enum
import GraphqlClientGenerator.MakeModule.InputObject as MakeModule.InputObject
import GraphqlClientGenerator.MakeModule.Interface as MakeModule.Interface
import GraphqlClientGenerator.MakeModule.Object as MakeModule.Object
import GraphqlClientGenerator.MakeModule.Query as MakeModule.Query
import GraphqlClientGenerator.MakeModule.Scalars as MakeModule.Scalars
import GraphqlClientGenerator.MakeModule.Scopes as MakeModule.Scopes
import GraphqlClientGenerator.MakeModule.Union as MakeModule.Union
import Language.PS.CST (ImportDecl(..), Module, ModuleName)
import Language.PS.CST.Printers (printModuleToString)
import Language.PS.CST.Sugar (mkModuleName)

type FilesMap =
  { dirs ::
    { "Enum" :: Map String String
    , "Object" :: Map String String
    , "Interface" :: Map String String
    , "Union" :: Map String String
    }
  , files ::
    { "Query" :: String
    , "InputObject" :: String
    , "Scopes" :: String
    }
  , "Scalars" :: Maybe String
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

fullTypeToModuleMapItem
  :: (ModuleName -> InstorpectionQueryResult__FullType -> Module)
  -> NonEmptyArray String
  -> String
  -> InstorpectionQueryResult__FullType
  -> Tuple String String
fullTypeToModuleMapItem
  mkModule
  apiModuleName
  submodule
  fullType =
  let
    name = StringsExtra.pascalCase fullType.name
    moduleName = mkModuleName $ apiModuleName <> (NonEmpty.cons' submodule [name])
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
mkFilesMap :: Maybe ModuleName -> NonEmptyArray String -> InstorpectionQueryResult -> FilesMap
mkFilesMap customScalarsModule apiModuleName introspectionQueryResult =
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

    importScalar :: ImportDecl
    importScalar = ImportDecl
      { moduleName: fromMaybe (mkModuleName $ apiModuleName <> NonEmpty.singleton "Scalars") customScalarsModule
      , names: []
      , qualification: Nothing
      }
  in
    { dirs:
      { "Enum":
        instorpectionQueryResult__FullType__enum
        <#> (fullTypeToModuleMapItem MakeModule.Enum.makeModule apiModuleName "Enum")
        # Map.fromFoldable
      , "Object":
        instorpectionQueryResult__FullType__object
        <#> (fullTypeToModuleMapItem (MakeModule.Object.makeModule importScalar apiModuleName instorpectionQueryResult__FullType__enum_names instorpectionQueryResult__FullType__interface_names) apiModuleName "Object")
        # Map.fromFoldable
      , "Interface":
        instorpectionQueryResult__FullType__interface
        <#> (fullTypeToModuleMapItem (MakeModule.Interface.makeModule importScalar apiModuleName instorpectionQueryResult__FullType__enum_names) apiModuleName "Interface")
        # Map.fromFoldable
      , "Union":
        onlyTypesWithoutExcluded TypeKind.Union
        <#> (fullTypeToModuleMapItem (MakeModule.Union.makeModule importScalar apiModuleName instorpectionQueryResult__FullType__enum_names) apiModuleName "Union")
        # Map.fromFoldable
      }
    , files:
      { "InputObject":
        let
          moduleName = mkModuleName $ apiModuleName <> NonEmpty.singleton "InputObject"

          inputObjectTypes :: Array InstorpectionQueryResult__FullType
          inputObjectTypes =
            introspectionQueryResult.__schema.types
            # Array.filter (\fullType -> fullType."kind" == TypeKind.InputObject)
            # Array.filter (\fullType -> not $ elem fullType.name builtInScalarNames)
         in printModuleToString $ MakeModule.InputObject.makeModule importScalar apiModuleName moduleName inputObjectTypes instorpectionQueryResult__FullType__enum_names
      , "Query":
        let
          moduleName = mkModuleName $ apiModuleName <> NonEmpty.singleton "Query"

          queryType :: Maybe InstorpectionQueryResult__FullType
          queryType = Array.find (\x -> x.name == introspectionQueryResult.__schema.queryType.name) introspectionQueryResult.__schema.types

          queryFields :: Array InstorpectionQueryResult__Field
          queryFields = maybe [] (\x -> fromMaybe [] x.fields) queryType
         in
          printModuleToString $
            MakeModule.Query.makeModule
            importScalar
            apiModuleName
            instorpectionQueryResult__FullType__enum_names
            instorpectionQueryResult__FullType__interface_names
            instorpectionQueryResult__FullType__object_names
            instorpectionQueryResult__FullType__union_names
            moduleName
            queryFields
      , "Scopes": printModuleToString $
          MakeModule.Scopes.makeModule
          apiModuleName
          instorpectionQueryResult__FullType__interface_names
          instorpectionQueryResult__FullType__object_names
          instorpectionQueryResult__FullType__union_names
          (mkModuleName $ apiModuleName <> NonEmpty.singleton "Scopes")
      }
    , "Scalars":
      case customScalarsModule of
           Just _ -> Nothing
           Nothing ->
            let
              moduleName = mkModuleName $ apiModuleName <> NonEmpty.singleton "Scalars"

              scalarTypes :: Array InstorpectionQueryResult__FullType
              scalarTypes =
                introspectionQueryResult.__schema.types
                # Array.filter (\fullType -> fullType."kind" == TypeKind.Scalar)
                # Array.filter (\fullType -> not $ elem fullType.name builtInScalarNames)
            in Just $ printModuleToString $ MakeModule.Scalars.makeModule moduleName scalarTypes
    }
