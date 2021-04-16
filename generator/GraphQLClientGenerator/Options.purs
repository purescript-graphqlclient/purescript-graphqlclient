module GraphQLClientGenerator.Options where

import Prelude
import UrlRegexSafe (defaultUrlRegexSafeOptions, urlRegexSafe)
import Affjax.RequestHeader as Affjax
import Control.Alt ((<|>))
import Data.Array (fromFoldable) as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.Either (Either(..))
import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Data.Maybe (Maybe(..))
import Data.Maybe as Maybe
import Data.String as String
import Data.String.Regex (test) as Regex
import Language.PS.SmartCST (ModuleName, mkModuleName)
import Node.Path (FilePath)
import Options.Applicative (Parser, ParserInfo, ReadM, fullDesc, header, help, helper, info, long, many, metavar, option, progDesc, showDefault, strOption, value, (<**>))
import Options.Applicative.Builder (eitherReader)

data AppOptionsInput
  = AppOptionsInputSchemaOrJsonUrl String
  | AppOptionsInputSchemaPath FilePath
  | AppOptionsInputJsonPath FilePath

derive instance genericAppOptionsInput :: Generic AppOptionsInput _

instance showAppOptionsInput :: Show AppOptionsInput where
  show = genericShow

newtype AppOptions
  = AppOptions
  { input :: AppOptionsInput
  , output :: FilePath
  , api :: NonEmptyArray String
  , headers :: Array Affjax.RequestHeader
  , customScalarsModule :: Maybe ModuleName
  }

derive instance genericAppOptions :: Generic AppOptions _

instance showAppOptions :: Show AppOptions where
  show = genericShow

requestHeader :: ReadM Affjax.RequestHeader
requestHeader =
  eitherReader
    $ \s -> case String.split (String.Pattern ": ") s of
        [ key, val ] -> Right $ Affjax.RequestHeader key val
        _ -> Left $ """Can’t parse as request header (there should be only one ": "): """ <> show s

url :: ReadM String
url =
  eitherReader
    $ \s ->
        if Regex.test (urlRegexSafe $ defaultUrlRegexSafeOptions { exact = true, strict = true }) s then
          Right s
        else
          Left $ "Can’t parse as Url: " <> show s

api :: ReadM (NonEmptyArray String)
api =
  eitherReader
    $ \s -> case s # String.split (String.Pattern ".") # NonEmpty.fromArray of
        Nothing -> Left $ "Can’t parse as api module name: " <> show s
        Just a -> Right a

moduleName :: ReadM ModuleName
moduleName =
  eitherReader
    $ \s -> case s # String.split (String.Pattern ".") # NonEmpty.fromArray of
        Nothing -> Left $ "Can’t parse as module name: " <> show s
        Just a -> Right (mkModuleName a)

appOptionsInputSchemaOrJsonUrl :: Parser AppOptionsInput
appOptionsInputSchemaOrJsonUrl =
  AppOptionsInputSchemaOrJsonUrl
    <$> option url
        ( long "input-url"
            <> metavar "URL"
            <> help "api url"
        )

appOptionsInputSchemaPath :: Parser AppOptionsInput
appOptionsInputSchemaPath =
  AppOptionsInputSchemaPath
    <$> strOption
        ( long "input-schema"
            <> metavar "FILEPATH"
            <> help "schema path, usually ends with .graphql"
        )

appOptionsInputJsonPath :: Parser AppOptionsInput
appOptionsInputJsonPath =
  AppOptionsInputJsonPath
    <$> strOption
        ( long "input-json"
            <> metavar "FILEPATH"
            <> help "introspection path, usually ends with .json"
        )

appOptionsInput :: Parser AppOptionsInput
appOptionsInput = appOptionsInputSchemaOrJsonUrl <|> appOptionsInputSchemaPath <|> appOptionsInputJsonPath

appOptions :: Parser AppOptions
appOptions = ado
  input <- appOptionsInput
  output <-
    strOption
      ( long "output"
          <> metavar "FILEPATH"
          <> help "Directory to output or override"
      )
  api <-
    option api
      ( long "api"
          <> help "Module name to prepend"
          <> showDefault
          <> value (NonEmpty.singleton "Api")
      )
  headers <-
    many
      ( option requestHeader
          ( long "header"
              <> help "Header value in form of “key: val”. This option can be repeated many times."
          )
      )
      <#> Array.fromFoldable
  customScalarsModule <-
    Maybe.optional
      ( option moduleName
          ( long "custom-scalars-module"
              <> help "Custom scalars module to generate. If none is specified, the generator will generate using the default scalar module."
              <> showDefault
          )
      )
  in AppOptions { input, output, api, headers, customScalarsModule }

opts :: ParserInfo AppOptions
opts =
  info (appOptions <**> helper)
    ( fullDesc
        <> progDesc "GraphQL API GraphQLClientGenerator"
        <> header "purescript-graphqlclient-generator - generates API modules from GraphQL schemas"
    )
