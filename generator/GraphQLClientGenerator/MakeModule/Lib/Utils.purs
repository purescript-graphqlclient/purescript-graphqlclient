module GraphQLClientGenerator.MakeModule.Lib.Utils where

import Language.PS.SmartCST
import Prelude

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.Show.Generic (genericShow)
import Data.Maybe (Maybe(..))
import Data.String.Extra as StringsExtra

tupleDecl :: PSType -> PSType -> PSType
tupleDecl x y =
  (TypeConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" [ "Tuple" ]) (ProperName "Tuple"))
    `TypeApp`
      x
    `TypeApp`
      y

tupleExpr :: Expr -> Expr -> Expr
tupleExpr x y =
  (ExprConstructor $ SmartQualifiedNameConstructor__Simple (mkModuleName $ NonEmpty.cons' "Data" [ "Tuple" ]) (ProperName "Tuple") (ProperName "Tuple"))
    `ExprApp`
      x
    `ExprApp`
      y

declDataWithoutConstructors :: String -> Declaration
declDataWithoutConstructors name =
  DeclData
    { comments: Nothing
    , head:
      DataHead
        { dataHdName: ProperName name
        , dataHdVars: []
        }
    , constructors: []
    }

appendToModule :: ModuleName -> Array String -> ModuleName
appendToModule (ModuleName xs) = ModuleName <<< NonEmpty.appendArray xs <<< map ProperName

qualifyScope :: NonEmptyArray String -> String -> SmartQualifiedName (ProperName ProperNameType_TypeName)
qualifyScope apiModuleName scopeName =
  let
    shouldBeImportedFromGraphQLClient = case scopeName of
      "Scope__RootSubscription" -> true
      "Scope__RootMutation" -> true
      "Scope__RootQuery" -> true
      _ -> false
  in
    if shouldBeImportedFromGraphQLClient then
      SmartQualifiedName__Simple (mkModuleName $ NonEmpty.singleton "GraphQLClient") $ ProperName scopeName
    else
      SmartQualifiedName__Simple (mkModuleName $ apiModuleName <> NonEmpty.singleton "Scopes") $ ProperName scopeName

mkDeriveClassAsNewtype ::
  { typeName :: String
  , typeModuleName :: ModuleName
  , className :: String
  , classModuleName :: ModuleName
  } -> Declaration
mkDeriveClassAsNewtype { typeName, typeModuleName, className, classModuleName } =
  DeclDerive
    { comments: Nothing
    , deriveType: DeclDeriveType_Newtype
    , head:
      { instName: Ident $ StringsExtra.camelCase className <> typeName
      , instConstraints: []
      , instClass: SmartQualifiedName__Simple classModuleName $ ProperName className
      , instTypes: NonEmpty.singleton $ TypeConstructor $ SmartQualifiedName__Simple typeModuleName $ ProperName typeName
      }
    }

mkDeriveNewtypeClass ::
  { typeName :: String
  , typeModuleName :: ModuleName
  } -> Declaration
mkDeriveNewtypeClass { typeName, typeModuleName } =
  DeclDerive
    { comments: Nothing
    , deriveType: DeclDeriveType_Ordinary
    , head:
      { instName: Ident $ "newtype" <> typeName
      , instConstraints: []
      , instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" [ "Newtype" ]) $ ProperName "Newtype"
      , instTypes: NonEmpty.cons' (TypeConstructor $ SmartQualifiedName__Simple typeModuleName $ ProperName typeName) [ TypeWildcard ]
      }
    }

mkDeriveGenericClass ::
  { typeName :: String
  , typeModuleName :: ModuleName
  } -> Declaration
mkDeriveGenericClass { typeName, typeModuleName } =
  DeclDerive
    { comments: Nothing
    , deriveType: DeclDeriveType_Ordinary
    , head:
      { instName: Ident $ "generic" <> typeName
      , instConstraints: []
      , instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" [ "Generic", "Rep" ]) $ ProperName "Generic"
      , instTypes: NonEmpty.cons' (TypeConstructor $ SmartQualifiedName__Simple typeModuleName $ ProperName typeName) [ TypeWildcard ]
      }
    }

mkShowClass ::
  { typeName :: String
  , typeModuleName :: ModuleName
  } -> Declaration
mkShowClass { typeName, typeModuleName } =
  DeclInstanceChain
    { comments: Nothing
    , instances: NonEmpty.singleton
      { head:
        { instName: Ident $ "show" <> typeName
        , instConstraints: []
        , instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" [ "Show" ]) $ ProperName "Show"
        , instTypes: NonEmpty.cons' (TypeConstructor $ SmartQualifiedName__Simple typeModuleName $ ProperName typeName) [ ]
        }
      , body:
        [ InstanceBindingName
          { name: Ident "show"
          , binders: []
          , guarded: Unconditional
            { expr: ExprIdent $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" [ "Generic", "Rep", "Show" ]) $ Ident "genericShow"
            , whereBindings: []
            }
          }
        ]
      }
    }

mkDeriveClass ::
  { typeName :: String
  , typeModuleName :: ModuleName
  , className :: String
  , classModuleName :: ModuleName
  } -> Declaration
mkDeriveClass { typeName, typeModuleName, className, classModuleName } =
  DeclDerive
    { comments: Nothing
    , deriveType: DeclDeriveType_Ordinary
    , head:
      { instName: Ident $ StringsExtra.camelCase className <> typeName
      , instConstraints: []
      , instClass: SmartQualifiedName__Simple classModuleName $ ProperName className
      , instTypes: NonEmpty.singleton $ TypeConstructor $ SmartQualifiedName__Simple typeModuleName $ ProperName typeName
      }
    }
