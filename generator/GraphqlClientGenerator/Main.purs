module GraphqlClientGenerator.Main where

import Protolude

import Control.Monad.Reader.Trans (ReaderT)
import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Decode (JsonDecodeError)
import Data.Argonaut.Decode as ArgonautDecoders
import Data.Argonaut.Parser (jsonParser) as ArgonautCore
import Data.Foldable (null)
import Data.Map (Map)
import Data.TraversableWithIndex (forWithIndex)
import GraphqlClient as GraphqlClient
import GraphqlClientGenerator.GraphqlJs as GraphqlJs
import GraphqlClientGenerator.IntrospectionSchema as GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.Options as GraphqlClientGenerator.Options
import GraphqlClientGenerator.PsCst as GraphqlClientGenerator.PsCst
import Node.Encoding (Encoding(..))
import Node.FS.Aff as Node.FS.Aff
import Node.FS.Aff.Mkdirp as Node.FS.Aff.Mkdirp
import Node.Path (FilePath)
import Node.Path (concat, resolve) as Node.FS
import Options.Applicative (execParser)
import Protolude.Node (exitWith)
import Record.Homogeneous (foldMapValuesWithIndexL)

type App a = ReaderT GraphqlClientGenerator.Options.AppOptions Aff a

includeDeprecated :: Boolean
includeDeprecated = true

introspectionQuery :: GraphqlClient.SelectionSet GraphqlClient.Scope__RootQuery GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQuery = GraphqlClientGenerator.IntrospectionSchema.introspectionQuery includeDeprecated

introspectionQueryString :: String
introspectionQueryString = GraphqlClient.writeGraphql introspectionQuery

introspectionQueryDecoder :: ArgonautCore.Json -> Either JsonDecodeError GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoder = GraphqlClient.getSelectionSetDecoder introspectionQuery

dirIsEmpty :: FilePath -> Aff Boolean
dirIsEmpty filepath = Node.FS.Aff.readdir filepath <#> null

main :: Effect Unit
main = do
  (GraphqlClientGenerator.Options.AppOptions appOptions) <- execParser GraphqlClientGenerator.Options.opts

  launchAff_ do
    (instorpectionQueryResult :: GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <-
      case appOptions.input of
        (GraphqlClientGenerator.Options.AppOptionsInputSchemaOrJsonUrl url) -> do
          let
            urlString = unwrap url

          resp <- GraphqlClient.gqlRequest urlString appOptions.headers introspectionQuery
            >>= (throwError <<< error <<< GraphqlClient.printGraphqlError) \/ pure

          pure resp
        (GraphqlClientGenerator.Options.AppOptionsInputSchemaPath filepath) -> do
          text <- Node.FS.Aff.readTextFile UTF8 filepath

          json <- GraphqlJs.generateIntrospectionJsonFromSchema text # throwError \/ pure

          introspectionQueryDecoder json # (throwError <<< error <<< ArgonautDecoders.printJsonDecodeError) \/ pure
        (GraphqlClientGenerator.Options.AppOptionsInputJsonPath filepath) -> do
          text <- Node.FS.Aff.readTextFile UTF8 filepath
          json <- ArgonautCore.jsonParser text # (throwError <<< error) \/ pure

          GraphqlClient.tryDecodeGraphqlResponse introspectionQueryDecoder json # (throwError <<< error <<< GraphqlClient.printGraphqlError) \/ pure

    outputDirAbs <- liftEffect $ Node.FS.resolve [] appOptions.output -- like realpath, but doesnt throw errors

    whenM (Node.FS.Aff.exists outputDirAbs) do
      isEmpty <- dirIsEmpty outputDirAbs
      unless isEmpty (exitWith 1 $ "Output dir " <> (show outputDirAbs) <> " is non empty. Cannot write files to it.")

    let
      filesMap = GraphqlClientGenerator.PsCst.mkFilesMap appOptions.customScalarsModule appOptions.api instorpectionQueryResult

      printModule :: FilePath -> String -> String -> Aff Unit
      printModule outputDir fileName content = do
        let
          outputFile :: FilePath
          outputFile = fileName <> ".purs"

          outputPath :: FilePath
          outputPath = Node.FS.concat [outputDir, outputFile]
        void $ Node.FS.Aff.Mkdirp.mkdirp outputDir
        Node.FS.Aff.writeTextFile UTF8 outputPath content
        pure unit

      printModuleForDirs :: String -> Map String String -> Aff Unit
      printModuleForDirs dirName mapOfFilenameAndContent =
        let
          outputDir :: FilePath
          outputDir = (Node.FS.concat $ [outputDirAbs, dirName])
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
      printModuleForMaybeFiles fileName = maybe (pure unit) \content ->
        let
          outputDir :: FilePath
          outputDir = outputDirAbs
        in
          void (printModule outputDir fileName content)

    foldMapValuesWithIndexL printModuleForDirs filesMap.dirs
    foldMapValuesWithIndexL printModuleForFiles filesMap.files
    foldMapValuesWithIndexL printModuleForMaybeFiles filesMap.maybeFiles
