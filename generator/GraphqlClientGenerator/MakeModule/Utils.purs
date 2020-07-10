module GraphqlClientGenerator.MakeModule.Utils where

import Protolude

import Language.PS.AST
import Language.PS.AST.Printers
import Language.PS.AST.Sugar

tupleDecl :: Type -> Type -> Type
tupleDecl x y =
  (TypeConstructor $ nonQualifiedName (ProperName "Tuple"))
  `TypeApp`
  x
  `TypeApp`
  y

tupleExpr :: Expr -> Expr -> Expr
tupleExpr x y =
  (ExprConstructor $ nonQualifiedName (ProperName "Tuple"))
  `ExprApp`
  x
  `ExprApp`
  y
