module GraphqlClientGenerator.Options where

import Protolude

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe as Maybe
import Data.String as String
import Language.PS.CST (ModuleName)
import Language.PS.CST.Sugar (mkModuleName)
import Node.Path (FilePath)
import Options.Applicative (Parser, ParserInfo, ReadM, fullDesc, header, help, helper, info, long, metavar, option, progDesc, showDefault, strOption, value, (<**>))
import Options.Applicative.Builder (eitherReader)
import Protolude.Url (Url)
import Protolude.Url as Url

data AppOptionsInput
  = AppOptionsInputSchemaOrJsonUrl Url
  | AppOptionsInputSchemaPath FilePath
  | AppOptionsInputJsonPath FilePath

derive instance genericAppOptionsInput :: Generic AppOptionsInput _
instance showAppOptionsInput :: Show AppOptionsInput where show = genericShow

newtype AppOptions = AppOptions
  { input               :: AppOptionsInput
  , output              :: FilePath
  , api                 :: NonEmptyArray String
  , customScalarsModule :: Maybe ModuleName
  }

derive instance genericAppOptions :: Generic AppOptions _
instance showAppOptions :: Show AppOptions where show = genericShow

url :: ReadM Url
url = eitherReader $ \s -> case Url.mkUrl s of
  Nothing -> Left $ "Can't parse as Url: " <> show s
  Just a -> Right a

api :: ReadM (NonEmptyArray String)
api = eitherReader $ \s -> case s # String.split (String.Pattern ".") # NonEmpty.fromArray of
  Nothing -> Left $ "Can't parse as api module name: " <> show s
  Just a -> Right a

moduleName :: ReadM ModuleName
moduleName = eitherReader $ \s -> case s # String.split (String.Pattern ".") # NonEmpty.fromArray of
  Nothing -> Left $ "Can't parse as module name: " <> show s
  Just a -> Right (mkModuleName a)

appOptionsInputSchemaOrJsonUrl :: Parser AppOptionsInput
appOptionsInputSchemaOrJsonUrl = AppOptionsInputSchemaOrJsonUrl <$> option url
  (  long "input-url"
  <> metavar "URL"
  <> help "api url"
  )

appOptionsInputSchemaPath :: Parser AppOptionsInput
appOptionsInputSchemaPath = AppOptionsInputSchemaPath <$> strOption
  (  long "input-schema"
  <> metavar "FILEPATH"
  <> help "schema path, usually ends with .graphql"
  )

appOptionsInputJsonPath :: Parser AppOptionsInput
appOptionsInputJsonPath = AppOptionsInputJsonPath <$> strOption
  (  long "input-json"
  <> metavar "FILEPATH"
  <> help "introspection path, usually ends with .json"
  )

appOptionsInput :: Parser AppOptionsInput
appOptionsInput = appOptionsInputSchemaOrJsonUrl <|> appOptionsInputSchemaPath <|> appOptionsInputJsonPath

appOptions :: Parser AppOptions
appOptions = map AppOptions $ { input: _, output: _, api: _, customScalarsModule: _ }
  <$> appOptionsInput
  <*> strOption
    (  long "output"
    <> metavar "FILEPATH"
    <> help "Directory to output or override"
    )
  <*> option api
    (  long "api"
    <> help "Module name to prepend"
    <> showDefault
    <> value (NonEmpty.singleton "Api")
    )
  <*> Maybe.optional
    ( option moduleName
      (  long "custom-scalars-module"
      <> help "Custom scalars module to generate. If no is specified - generator will generate default scalar module"
      <> showDefault
      )
    )

opts :: ParserInfo AppOptions
opts = info (appOptions <**> helper)
  (  fullDesc
  <> progDesc "Graphql api GraphqlClientGenerator"
  <> header "purescript-graphql-client-GraphqlClientGenerator - generates Api modules from schema"
  )
