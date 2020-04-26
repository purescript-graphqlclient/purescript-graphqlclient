module Fernet.Decode.GraphqlEnum where

import Prelude
import Control.Alt ((<|>))
import Control.Monad.Error.Class (throwError)
import Data.Generic.Rep (class Generic, Constructor(..), NoArguments(..), Sum(..), to)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.String.CaseInsensitive (CaseInsensitiveString(..))
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Data.Argonaut.Core (Json, isNull, caseJsonNull, caseJsonBoolean, caseJsonNumber, caseJsonString, toArray, toObject, toString, stringify)
import Data.Either (Either(..), note)
import Data.Argonaut.Decode as Data.Argonaut.Decode

genericDecodeGraphqlEnum ::
  forall a rep.
  Generic a rep =>
  GenericDecodeGraphqlEnum rep =>
  Json -> Either String a
genericDecodeGraphqlEnum json = to <$> genericDecodeGraphqlEnumImpl json

class GenericDecodeGraphqlEnum rep where
  genericDecodeGraphqlEnumImpl :: Json -> Either String rep

instance sumGenericDecodeGraphqlEnum ::
  ( GenericDecodeGraphqlEnum a
  , GenericDecodeGraphqlEnum b
  ) =>
  GenericDecodeGraphqlEnum (Sum a b) where
  genericDecodeGraphqlEnumImpl json =
    Inl <$> genericDecodeGraphqlEnumImpl json
      <|> Inr
      <$> genericDecodeGraphqlEnumImpl json

instance constructorGenericDecodeGraphqlEnum ::
  ( IsSymbol name
    ) =>
  GenericDecodeGraphqlEnum (Constructor name NoArguments) where
  genericDecodeGraphqlEnumImpl json = do
    string <- Data.Argonaut.Decode.decodeJson json
    if deleteUnderscores string == CaseInsensitiveString name then
      Right $ Constructor NoArguments
    else
      Left $ "Enum string " <> string <> " did not match expected string " <> name
    where
          deleteUnderscores :: String -> CaseInsensitiveString
          deleteUnderscores = replaceAll (Pattern "_") (Replacement "") >>> CaseInsensitiveString

          name :: String
          name = reflectSymbol (SProxy :: SProxy name)
