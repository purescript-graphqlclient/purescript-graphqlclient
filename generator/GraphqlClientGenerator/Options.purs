module GraphqlClientGenerator.Options where

import Protolude

import Data.Generic.Rep.Show (genericShow)
import Protolude.Url (Url)
import Protolude.Url as Url
import Node.Path (FilePath)
import Options.Applicative (Parser, ParserInfo, ReadM, fullDesc, header, help, helper, info, long, metavar, option, progDesc, showDefault, strOption, value, (<**>))
import Options.Applicative.Builder (eitherReader)

data AppOptionsInput
  = AppOptionsInputSchemaOrJsonUrl Url
  | AppOptionsInputSchemaPath FilePath
  | AppOptionsInputJsonPath FilePath

derive instance genericAppOptionsInput :: Generic AppOptionsInput _
instance showAppOptionsInput :: Show AppOptionsInput where show = genericShow

newtype AppOptions = AppOptions
  { input :: AppOptionsInput
  , output  :: FilePath
  , api  :: String
  -- , codecsModule :: String
  }

derive instance genericAppOptions :: Generic AppOptions _
instance showAppOptions :: Show AppOptions where show = genericShow


-- AppOptionsInputSchemaOrJsonUrl Url
-- AppOptionsInputSchemaPath FilePath
-- AppOptionsInputJsonPath FilePath

url :: ReadM Url
url = eitherReader $ \s -> case Url.mkUrl s of
  Nothing -> Left $ "Can't parse as Url: " <> show s
  Just a -> Right a


appOptionsInputSchemaOrJsonUrl :: Parser AppOptionsInput
appOptionsInputSchemaOrJsonUrl = AppOptionsInputSchemaOrJsonUrl <$> option url
  (  long "input-url"
  <> metavar "URL"
  <> help "schema or json url"
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
appOptions = map AppOptions $ ({ input: _, output: _, api: _ })
      <$> appOptionsInput
      <*> strOption
        (  long "output"
        <> metavar "FILEPATH"
        <> help "Directory to output or override"
        )
      <*> strOption
          (  long "api"
          <> help "Module name to prepend"
          <> showDefault
          <> value "Api"
          )

opts :: ParserInfo AppOptions
opts = info (appOptions <**> helper)
  ( fullDesc
  <> progDesc "Graphql api GraphqlClientGenerator"
  <> header "purescript-graphql-client-GraphqlClientGenerator - generates Api modules from schema" )
