module GraphQLClient.GraphQLEnum where

import Prelude
import Control.Alt ((<|>))
import Data.Argonaut.Core (Json, fromString)
import Data.Argonaut.Decode as ArgonautCodecs
import Data.Either (Either(..))
import Data.Generic.Rep (class Generic, Constructor(..), NoArguments(..), Sum(..), to)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.String.CaseInsensitive (CaseInsensitiveString(..))
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)

genericDecodeGraphQLEnum ::
  forall a rep.
  Generic a rep =>
  GenericDecodeGraphQLEnum rep =>
  Json -> Either ArgonautCodecs.JsonDecodeError a
genericDecodeGraphQLEnum json = to <$> genericDecodeGraphQLEnumImpl json

class GenericDecodeGraphQLEnum rep where
  genericDecodeGraphQLEnumImpl :: Json -> Either ArgonautCodecs.JsonDecodeError rep

instance sumGenericDecodeGraphQLEnum ::
  ( GenericDecodeGraphQLEnum a
  , GenericDecodeGraphQLEnum b
  ) =>
  GenericDecodeGraphQLEnum (Sum a b) where
  genericDecodeGraphQLEnumImpl json =
    Inl <$> genericDecodeGraphQLEnumImpl json
      <|> Inr
      <$> genericDecodeGraphQLEnumImpl json

instance constructorGenericDecodeGraphQLEnum ::
  ( IsSymbol name
    ) =>
  GenericDecodeGraphQLEnum (Constructor name NoArguments) where
  genericDecodeGraphQLEnumImpl json = do
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
