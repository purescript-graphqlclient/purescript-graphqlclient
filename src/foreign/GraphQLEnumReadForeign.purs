-- This code is adapted from https://purescript-simple-json.readthedocs.io/en/latest/generics-rep.html
module Fernet.Foreign.GraphQLEnumReadForeign where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.Error.Class (throwError)
import Data.Generic.Rep (class Generic, Constructor(..), NoArguments(..), Sum(..), to)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.String.CaseInsensitive (CaseInsensitiveString(..))
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Foreign (F, Foreign, ForeignError(..))
import Simple.JSON (readImpl)

graphQLEnumReadForeign ::
  forall a rep.
  Generic a rep =>
  GraphQLEnumReadForeign rep =>
  Foreign -> F a
graphQLEnumReadForeign f =
  to <$> graphQLEnumReadForeignImpl f

class GraphQLEnumReadForeign rep where
  graphQLEnumReadForeignImpl :: Foreign -> F rep

instance sumGraphQLEnumReadForeign ::
  ( GraphQLEnumReadForeign a
  , GraphQLEnumReadForeign b
  ) => GraphQLEnumReadForeign (Sum a b) where
  graphQLEnumReadForeignImpl f =
    Inl <$> graphQLEnumReadForeignImpl f
    <|> Inr <$> graphQLEnumReadForeignImpl f


instance constructorGraphQLEnumReadForeign ::
  ( IsSymbol name
  ) => GraphQLEnumReadForeign (Constructor name NoArguments) where
  graphQLEnumReadForeignImpl f = do
    s <- readImpl f
    if deleteUnderscores s == CaseInsensitiveString name
      then pure $ Constructor NoArguments
      else throwError <<< pure <<< ForeignError $
        "Enum string " <> s <> " did not match expected string " <> name
    where
      deleteUnderscores = replaceAll (Pattern "_") (Replacement "") >>> CaseInsensitiveString
      name = reflectSymbol (SProxy :: SProxy name)
