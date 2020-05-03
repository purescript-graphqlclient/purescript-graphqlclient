module Fernet.Decode.GraphqlEnum where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.Error.Class (throwError)
import Data.Argonaut.Core (Json, caseJsonBoolean, caseJsonNull, caseJsonNumber, caseJsonString, fromString, isNull, stringify, toArray, toObject, toString)
import Data.Argonaut.Decode as ArgonautCodecs
import Data.Either (Either(..), note)
import Data.Generic.Rep (class Generic, Constructor(..), NoArguments(..), Sum(..), to)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.String.CaseInsensitive (CaseInsensitiveString(..))
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)

genericDecodeGraphqlEnum ::
  forall a rep.
  Generic a rep =>
  GenericDecodeGraphqlEnum rep =>
  Json -> Either ArgonautCodecs.JsonDecodeError a
genericDecodeGraphqlEnum json = to <$> genericDecodeGraphqlEnumImpl json

class GenericDecodeGraphqlEnum rep where
  genericDecodeGraphqlEnumImpl :: Json -> Either ArgonautCodecs.JsonDecodeError rep

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
    string <- ArgonautCodecs.decodeJson json
    if deleteUnderscores string == CaseInsensitiveString name then
      Right $ Constructor NoArguments
    else
      Left $ ArgonautCodecs.Named name $ ArgonautCodecs.UnexpectedValue (fromString string)
    where
      deleteUnderscores :: String -> CaseInsensitiveString
      deleteUnderscores = replaceAll (Pattern "_") (Replacement "") >>> CaseInsensitiveString

      name :: String
      name = reflectSymbol (SProxy :: SProxy name)
