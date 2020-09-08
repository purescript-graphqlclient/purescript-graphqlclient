module GraphQLClientGenerator.MakeModule.Lib.Utils where

import Language.PS.SmartCST (SmartQualifiedNameConstructor(..), DataHead(..), Declaration(..), Expr(..), ModuleName(..), ProperName(..), ProperNameType_TypeName, SmartQualifiedName(..), Type(..), mkModuleName)
import Protolude

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty

tupleDecl :: Type -> Type -> Type
tupleDecl x y =
  (TypeConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" ["Tuple"]) (ProperName "Tuple"))
  `TypeApp`
  x
  `TypeApp`
  y

tupleExpr :: Expr -> Expr -> Expr
tupleExpr x y =
  (ExprConstructor $ SmartQualifiedNameConstructor__Simple (mkModuleName $ NonEmpty.cons' "Data" ["Tuple"]) (ProperName "Tuple") (ProperName "Tuple"))
  `ExprApp`
  x
  `ExprApp`
  y

declDataWithoutConstructors :: String -> Declaration
declDataWithoutConstructors name = DeclData
  { comments: Nothing
  , head: DataHead
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
    shouldBeImportedFromGraphQLClient =
      case scopeName of
           "Scope__RootSubscription" -> true
           "Scope__RootMutation" -> true
           "Scope__RootQuery" -> true
           _ -> false
  in if shouldBeImportedFromGraphQLClient
       then SmartQualifiedName__Simple (mkModuleName $ NonEmpty.singleton "GraphQLClient") $ ProperName scopeName
       else SmartQualifiedName__Simple (mkModuleName $ apiModuleName <> NonEmpty.singleton "Scopes") $ ProperName scopeName
