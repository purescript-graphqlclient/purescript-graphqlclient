module GraphQLClientGenerator.PsCst where

import Prelude

import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.Foldable (elem)
import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Tuple (Tuple(..))
import Data.String.Extra as StringsExtra
import Data.String.Utils as String
import Dodo as Dodo
import GraphQLClient.Utils (anyPredicate)
import GraphQLClientGenerator.IntrospectionSchema (InstorpectionQueryResult, InstorpectionQueryResult__Field, InstorpectionQueryResult__FullType)
import GraphQLClientGenerator.IntrospectionSchema.TypeKind as TypeKind
import GraphQLClientGenerator.MakeModule.Enum as MakeModule.Enum
import GraphQLClientGenerator.MakeModule.InputObject as MakeModule.InputObject
import GraphQLClientGenerator.MakeModule.Interface as MakeModule.Interface
import GraphQLClientGenerator.MakeModule.Mutation as MakeModule.Mutation
import GraphQLClientGenerator.MakeModule.Object as MakeModule.Object
import GraphQLClientGenerator.MakeModule.Query as MakeModule.Query
import GraphQLClientGenerator.MakeModule.Scalars as MakeModule.Scalars
import GraphQLClientGenerator.MakeModule.Scopes as MakeModule.Scopes
import GraphQLClientGenerator.MakeModule.Subscription as MakeModule.Subscription
import GraphQLClientGenerator.MakeModule.Union as MakeModule.Union
import Language.PS.SmartCST (Module, ModuleName, mkModuleName, printModule)

printModuleToString :: Module -> String
printModuleToString = printModule >>> Dodo.print Dodo.plainText Dodo.twoSpaces

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
  , maybeFiles ::
    { "Scalars" :: Maybe String
    , "Mutation" :: Maybe String
    , "Subscription" :: Maybe String
    }
  }

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
   in Tuple name (printModuleToString $ mkModule moduleName fullType)

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
    excludeMutation name     = introspectionQueryResult.__schema.mutationType # maybe false (\type_ -> type_.name == name)
    excludeSubscription name = introspectionQueryResult.__schema.subscriptionType # maybe false (\type_ -> type_.name == name)
    excludeBuiltIn           = isBuiltIn

    nameToScope :: String -> String
    nameToScope = doQuery >>> doMutation >>> doSubscription >>> StringsExtra.pascalCase >>> (\x -> "Scope__" <> x)
      where
        doQuery :: String -> String
        doQuery str =
          if str == introspectionQueryResult.__schema.queryType.name
            then "RootQuery"
            else str

        doMutation :: String -> String
        doMutation str =
          case introspectionQueryResult.__schema.mutationType of
               Nothing -> str
               Just { name } ->
                  if str == name
                    then "RootMutation"
                    else str

        doSubscription :: String -> String
        doSubscription str =
          case introspectionQueryResult.__schema.subscriptionType of
               Nothing -> str
               Just { name } ->
                  if str == name
                    then "RootSubscription"
                    else str

    notExcluded = not $ anyPredicate [excludeQuery, excludeMutation, excludeSubscription, excludeBuiltIn]

    onlyTypesWithoutExcluded :: TypeKind.TypeKind -> Array InstorpectionQueryResult__FullType
    onlyTypesWithoutExcluded typeKind =
      introspectionQueryResult.__schema.types
      # Array.filter (\fullType -> fullType."kind" == typeKind)
      # Array.filter (\fullType -> notExcluded fullType.name)

    instorpectionQueryResult__FullType__enum :: Array InstorpectionQueryResult__FullType
    instorpectionQueryResult__FullType__enum = onlyTypesWithoutExcluded TypeKind.Enum

    instorpectionQueryResult__FullType__enum_names :: Array String
    instorpectionQueryResult__FullType__enum_names = instorpectionQueryResult__FullType__enum <#> _.name <#> StringsExtra.pascalCase # Array.sort

    instorpectionQueryResult__FullType__interface :: Array InstorpectionQueryResult__FullType
    instorpectionQueryResult__FullType__interface = onlyTypesWithoutExcluded TypeKind.Interface

    instorpectionQueryResult__FullType__interface_names :: Array String
    instorpectionQueryResult__FullType__interface_names = instorpectionQueryResult__FullType__interface <#> _.name <#> StringsExtra.pascalCase # Array.sort

    instorpectionQueryResult__FullType__object :: Array InstorpectionQueryResult__FullType
    instorpectionQueryResult__FullType__object = onlyTypesWithoutExcluded TypeKind.Object

    instorpectionQueryResult__FullType__object_names :: Array String
    instorpectionQueryResult__FullType__object_names = instorpectionQueryResult__FullType__object <#> _.name <#> StringsExtra.pascalCase # Array.sort

    instorpectionQueryResult__FullType__union :: Array InstorpectionQueryResult__FullType
    instorpectionQueryResult__FullType__union = onlyTypesWithoutExcluded TypeKind.Union

    instorpectionQueryResult__FullType__union_names :: Array String
    instorpectionQueryResult__FullType__union_names = instorpectionQueryResult__FullType__union <#> _.name <#> StringsExtra.pascalCase # Array.sort

    scalarModule :: ModuleName
    scalarModule = fromMaybe (mkModuleName $ apiModuleName <> NonEmpty.singleton "Scalars") customScalarsModule
  in
    { dirs:
      { "Enum":
        instorpectionQueryResult__FullType__enum
        <#> (fullTypeToModuleMapItem MakeModule.Enum.makeModule apiModuleName "Enum")
        # Map.fromFoldable
      , "Object":
        instorpectionQueryResult__FullType__object
        <#> (fullTypeToModuleMapItem (MakeModule.Object.makeModule nameToScope scalarModule apiModuleName instorpectionQueryResult__FullType__enum_names instorpectionQueryResult__FullType__interface_names) apiModuleName "Object")
        # Map.fromFoldable
      , "Interface":
        instorpectionQueryResult__FullType__interface
        <#> (fullTypeToModuleMapItem (MakeModule.Interface.makeModule nameToScope scalarModule apiModuleName instorpectionQueryResult__FullType__enum_names) apiModuleName "Interface")
        # Map.fromFoldable
      , "Union":
        onlyTypesWithoutExcluded TypeKind.Union
        <#> (fullTypeToModuleMapItem (MakeModule.Union.makeModule nameToScope scalarModule apiModuleName instorpectionQueryResult__FullType__enum_names) apiModuleName "Union")
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
         in printModuleToString $ MakeModule.InputObject.makeModule scalarModule apiModuleName moduleName inputObjectTypes
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
            nameToScope
            scalarModule
            apiModuleName
            instorpectionQueryResult__FullType__enum_names
            instorpectionQueryResult__FullType__interface_names
            instorpectionQueryResult__FullType__object_names
            instorpectionQueryResult__FullType__union_names
            moduleName
            queryFields
      , "Scopes": printModuleToString $
          MakeModule.Scopes.makeModule
          nameToScope
          apiModuleName
          instorpectionQueryResult__FullType__interface_names
          instorpectionQueryResult__FullType__object_names
          instorpectionQueryResult__FullType__union_names
          (mkModuleName $ apiModuleName <> NonEmpty.singleton "Scopes")
      }
    , maybeFiles:
      { "Scalars":
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
      , "Mutation": do
          (mutationType :: { name :: String }) <- introspectionQueryResult.__schema.mutationType
          (mutation :: InstorpectionQueryResult__FullType) <- Array.find (\x -> x.name == mutationType.name) introspectionQueryResult.__schema.types
          (fields :: Array InstorpectionQueryResult__Field) <- mutation.fields >>= case _ of
                                                                                        [] -> Nothing
                                                                                        arr -> Just arr

          let moduleName = mkModuleName $ apiModuleName <> NonEmpty.singleton "Mutation"

          Just $ printModuleToString $
            MakeModule.Mutation.makeModule
            nameToScope
            scalarModule
            apiModuleName
            instorpectionQueryResult__FullType__enum_names
            instorpectionQueryResult__FullType__interface_names
            instorpectionQueryResult__FullType__object_names
            instorpectionQueryResult__FullType__union_names
            moduleName
            fields
      , "Subscription": do
          (subscriptionType :: { name :: String }) <- introspectionQueryResult.__schema.subscriptionType
          (subscription :: InstorpectionQueryResult__FullType) <- Array.find (\x -> x.name == subscriptionType.name) introspectionQueryResult.__schema.types
          (fields :: Array InstorpectionQueryResult__Field) <- subscription.fields >>= case _ of
                                                                                        [] -> Nothing
                                                                                        arr -> Just arr

          let moduleName = mkModuleName $ apiModuleName <> NonEmpty.singleton "Subscription"

          Just $ printModuleToString $
            MakeModule.Subscription.makeModule
            nameToScope
            scalarModule
            apiModuleName
            moduleName
            fields
      }
    }
