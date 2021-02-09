module Dillonkearns.GraphQLClientGenerator.Main where

import Prelude
import Ansi.Codes (Color(..)) as Ansi
import Ansi.Output (foreground, withGraphics) as Ansi
import Control.Monad.Error.Class (throwError)
import Control.Monad.Reader.Trans (ReaderT)
import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Decode (JsonDecodeError)
import Data.Argonaut.Decode as ArgonautDecoders
import Data.Argonaut.Parser (jsonParser) as ArgonautCore
import Data.Either (Either, either)
import Data.Foldable (null)
import Data.Map (Map)
import Data.Maybe (Maybe, maybe)
import Data.TraversableWithIndex (forWithIndex)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Class.Console (error, log) as Console
import Effect.Exception (error)
import Effect.Exception.Unsafe (unsafeThrow)
import Dillonkearns.GraphQLClient as GraphQLClient
import Dillonkearns.GraphQLClient.Implementation as GraphQLClient.Implementation
import Dillonkearns.GraphQLClientGenerator.GraphQLJs as GraphQLJs
import Dillonkearns.GraphQLClientGenerator.IntrospectionSchema as GraphQLClientGenerator.IntrospectionSchema
import Dillonkearns.GraphQLClientGenerator.Options as GraphQLClientGenerator.Options
import Dillonkearns.GraphQLClientGenerator.PsCst as GraphQLClientGenerator.PsCst
import Node.Encoding (Encoding(..))
import Node.FS.Aff as Node.FS.Aff
import Node.FS.Aff.Mkdirp as Node.FS.Aff.Mkdirp
import Node.Path (FilePath)
import Node.Path (concat, resolve) as Node.FS
import Node.Process (exit) as NodeProcess
import Options.Applicative (execParser)
import Record.Homogeneous (foldMapValuesWithIndexL)

type App a
  = ReaderT GraphQLClientGenerator.Options.AppOptions Aff a

includeDeprecated :: Boolean
includeDeprecated = true

introspectionQueryString :: String
introspectionQueryString = GraphQLClient.writeGraphQL (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery (\_ _ -> unsafeThrow "I don’t care about decoder") includeDeprecated)

introspectionQueryDecoderForExternalJson :: ArgonautCore.Json -> Either JsonDecodeError GraphQLClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoderForExternalJson = GraphQLClient.getSelectionSetDecoder (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery GraphQLClient.Implementation.fieldNameWithoutHash includeDeprecated)

dirIsEmpty :: FilePath -> Aff Boolean
dirIsEmpty filepath = Node.FS.Aff.readdir filepath <#> null

-- | Exit the script with the given exit code, printing the given message to
-- | standard output if the exit code is 0, and standard error otherwise.
exitWith :: ∀ m a. MonadEffect m => Int -> String -> m a
exitWith code msg = do
  if code == 0 then
    Console.log $ Ansi.withGraphics (Ansi.foreground Ansi.BrightGreen) msg
  else
    Console.error $ Ansi.withGraphics (Ansi.foreground Ansi.BrightRed) msg
  liftEffect $ NodeProcess.exit code

main :: Effect Unit
main = do
  (GraphQLClientGenerator.Options.AppOptions appOptions) <- execParser GraphQLClientGenerator.Options.opts
  launchAff_ do
    (instorpectionQueryResult :: GraphQLClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <- case appOptions.input of
      (GraphQLClientGenerator.Options.AppOptionsInputSchemaOrJsonUrl url) -> do
        let
          opts = GraphQLClient.defaultRequestOptions { headers = appOptions.headers }
        resp <-
          GraphQLClient.graphqlQueryRequest url opts (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery GraphQLClient.Implementation.fieldNameWithHash includeDeprecated)
            >>= either (throwError <<< error <<< GraphQLClient.printGraphQLError) pure
        pure resp
      (GraphQLClientGenerator.Options.AppOptionsInputSchemaPath filepath) -> do
        text <- Node.FS.Aff.readTextFile UTF8 filepath
        json <- GraphQLJs.generateIntrospectionJsonFromSchema text # either throwError pure
        introspectionQueryDecoderForExternalJson json # either (throwError <<< error <<< ArgonautDecoders.printJsonDecodeError) pure
      (GraphQLClientGenerator.Options.AppOptionsInputJsonPath filepath) -> do
        text <- Node.FS.Aff.readTextFile UTF8 filepath
        json <- ArgonautCore.jsonParser text # either (throwError <<< error) pure
        GraphQLClient.tryDecodeGraphQLResponse introspectionQueryDecoderForExternalJson json # either (throwError <<< error <<< GraphQLClient.printGraphQLError) pure
    outputDirAbs <- liftEffect $ Node.FS.resolve [] appOptions.output -- like realpath, but doesn’t throw errors
    whenM (Node.FS.Aff.exists outputDirAbs) do
      isEmpty <- dirIsEmpty outputDirAbs
      unless isEmpty (exitWith 1 $ "Output dir " <> (show outputDirAbs) <> " is non empty. Cannot write files to it.")
    let
      filesMap = GraphQLClientGenerator.PsCst.mkFilesMap appOptions.customScalarsModule appOptions.api instorpectionQueryResult

      printModule :: FilePath -> String -> String -> Aff Unit
      printModule outputDir fileName content = do
        let
          outputFile :: FilePath
          outputFile = fileName <> ".purs"

          outputPath :: FilePath
          outputPath = Node.FS.concat [ outputDir, outputFile ]
        void $ Node.FS.Aff.Mkdirp.mkdirp outputDir
        Node.FS.Aff.writeTextFile UTF8 outputPath content
        pure unit

      printModuleForDirs :: String -> Map String String -> Aff Unit
      printModuleForDirs dirName mapOfFilenameAndContent =
        let
          outputDir :: FilePath
          outputDir = (Node.FS.concat $ [ outputDirAbs, dirName ])
        in
          void (forWithIndex mapOfFilenameAndContent (printModule outputDir))

      printModuleForFiles :: String -> String -> Aff Unit
      printModuleForFiles fileName content =
        let
          outputDir :: FilePath
          outputDir = outputDirAbs
        in
          void (printModule outputDir fileName content)

      printModuleForMaybeFiles :: String -> Maybe String -> Aff Unit
      printModuleForMaybeFiles fileName =
        maybe (pure unit) \content ->
          let
            outputDir :: FilePath
            outputDir = outputDirAbs
          in
            void (printModule outputDir fileName content)
    foldMapValuesWithIndexL printModuleForDirs filesMap.dirs
    foldMapValuesWithIndexL printModuleForFiles filesMap.files
    foldMapValuesWithIndexL printModuleForMaybeFiles filesMap.maybeFiles
