module GraphqlClientGenerator.MakeModule.Lib.Utils where

import Language.PS.SmartCST
import Language.PS.SmartCST
import Protolude

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra

tupleDecl :: Type -> Type -> Type
tupleDecl x y =
  (TypeConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" ["Tuple"]) (ProperName "Tuple"))
  `TypeApp`
  x
  `TypeApp`
  y

tupleExpr :: Expr -> Expr -> Expr
tupleExpr x y =
  (ExprConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" ["Tuple"]) (ConstructorProperName { constructor: ProperName "Tuple", type_: ProperName "Tuple" }))
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
    shouldBeImportedFromGraphqlClient =
      case scopeName of
           "Scope__RootSubscription" -> true
           "Scope__RootMutation" -> true
           "Scope__RootQuery" -> true
           _ -> false
  in if shouldBeImportedFromGraphqlClient
       then SmartQualifiedName__Simple (mkModuleName $ NonEmpty.singleton "GraphqlClient") $ ProperName scopeName
       else SmartQualifiedName__Simple (mkModuleName $ apiModuleName <> NonEmpty.singleton "Scopes") $ ProperName scopeName
