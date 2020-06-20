module Generator.Main where

import Protolude
import Protolude.Node

import Control.Monad.Reader.Trans (ReaderT(..), runReaderT)
import Control.Parallel (parTraverse)
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode (Decoder)
import Data.Argonaut.Decode as ArgonautDecoders
import Data.Argonaut.Decode.Implementation (decodeJObject) as ArgonautCodecs.Decode.Implementation
import Data.Argonaut.Parser as ArgonautCore
import Data.Array (filter)
import Data.Array (fromFoldable) as Array
import Data.Array (replicate)
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmptyArray
import Data.Either (Either(..))
import Data.Foldable (null, sequence_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.NonEmpty (NonEmpty(..), (:|))
import Data.String (joinWith, take)
import Data.Symbol (SProxy(..))
import Data.TraversableWithIndex (forWithIndex)
import Effect.Aff (launchAff_)
import Effect.Class.Console (logShow, log)
import Effect.Exception (error)
import Fernet.Graphql.SelectionSet as Fernet.Graphql.SelectionSet
import Fernet.Graphql.WriteGraphql as Fernet.Graphql.WriteGraphql
import Fernet.HTTP as Fernet.HTTP
import Fernet.Introspection.IntrospectionSchema as Fernet.Introspection.IntrospectionSchema
import Fernet.Introspection.Schema.TypeKind (TypeKind(..))
import Foreign.Object (Object)
import Generator.GraphqlJs as GraphqlJs
import Generator.Options as Generator.Options
import Generator.PsAst as Generator.PsAst
import Node.Encoding (Encoding(..))
import Node.FS.Aff as Node.FS.Aff
import Node.FS.Aff.Mkdirp as Node.FS.Aff.Mkdirp
import Node.Path (FilePath)
import Node.Path (concat, resolve) as Node.FS
import Options.Applicative (execParser)
import Protolude.Url (Url)
import Protolude.Url as Url

greet :: Generator.Options.AppOptions -> Effect Unit
greet (Generator.Options.AppOptions { input, output, api }) = log $ "Hello, " <> show input <> show output <> show api

type App a = ReaderT Generator.Options.AppOptions Aff a

includeDeprecated :: Boolean
includeDeprecated = true

introspectionQuery :: Fernet.Graphql.SelectionSet.SelectionSet Fernet.Graphql.SelectionSet.RootQuery Fernet.Introspection.IntrospectionSchema.InstorpectionQueryResult
introspectionQuery = Fernet.Introspection.IntrospectionSchema.introspectionQuery includeDeprecated

introspectionQueryString :: String
introspectionQueryString = Fernet.Graphql.WriteGraphql.writeGraphql introspectionQuery

introspectionQueryDecoder :: Decoder Fernet.Introspection.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoder = Fernet.Graphql.SelectionSet.getSelectionSetDecoder introspectionQuery

dirIsEmpty :: FilePath -> Aff Boolean
dirIsEmpty filepath = Node.FS.Aff.readdir filepath <#> null

main :: Effect Unit
main = do
  (Generator.Options.AppOptions appOptions) <- execParser Generator.Options.opts

  launchAff_ do
    -- spago run --main Generator.Main --node-args "--input-url https://countries.trevorblades.com/ --output examples/countries"
    (instorpectionQueryResult :: Fernet.Introspection.IntrospectionSchema.InstorpectionQueryResult) <- case appOptions.input of
      (Generator.Options.AppOptionsInputSchemaOrJsonUrl url) -> do
        let
          urlString = unwrap url

        resp <- Fernet.HTTP.gqlRequest urlString introspectionQuery
          >>= (throwError <<< error <<< Fernet.HTTP.printGraphqlError) \/ pure

        pure resp
      (Generator.Options.AppOptionsInputSchemaPath filepath) -> do
        text <- Node.FS.Aff.readTextFile UTF8 filepath

        json <- GraphqlJs.generateIntrospectionJsonFromSchema text # throwError \/ pure

        introspectionQueryDecoder json # (throwError <<< error <<< ArgonautDecoders.printJsonDecodeError) \/ pure
      (Generator.Options.AppOptionsInputJsonPath filepath) -> do
        text <- Node.FS.Aff.readTextFile UTF8 filepath
        json <- ArgonautCore.jsonParser text # (throwError <<< error) \/ pure

        Fernet.HTTP.tryDecodeGraphqlResponse introspectionQueryDecoder json # (throwError <<< error <<< Fernet.HTTP.printGraphqlError) \/ pure

    outputDirAbs <- liftEffect $ Node.FS.resolve [] appOptions.output -- like realpath, but doesnt throw errors

    whenM (Node.FS.Aff.exists outputDirAbs)
      dirIsEmpty outputDirAbs >>=
        \isEmpty -> unless isEmpty (exitWith 1 $ "Output dir " <> show outputDirAbs <> " is non empty. Cannot write files to it.")

    let
      filesMap = Generator.PsAst.mkFilesMap appOptions.api instorpectionQueryResult

    void $ filesMap.dirs."Enum" `forWithIndex`
      (\moduleName content -> do
        let
          moduleNameWords :: NonEmptyArray String
          moduleNameWords = moduleName # unwrap <#> unwrap # NonEmptyArray.fromNonEmpty

          moduleNameWords' :: { init :: Array String, last :: String }
          moduleNameWords' = NonEmptyArray.unsnoc moduleNameWords

          outputDir :: FilePath
          outputDir = (Node.FS.concat $ [outputDirAbs] <> moduleNameWords'.init)

          outputFile :: FilePath
          outputFile = moduleNameWords'.last <> ".purs"

          outputPath :: FilePath
          outputPath = Node.FS.concat [outputDir, outputFile]
        void $ Node.FS.Aff.Mkdirp.mkdirp outputDir
        Node.FS.Aff.writeTextFile UTF8 outputPath content
        pure unit
      )

        -- let dir = "examples/countries"
        -- void $ Node.FS.Aff.Mkdirp.mkdirp dir
        -- writePurescriptFiles dir $ onlyObjects >>> (filter (not <<< isSchemaObject)) $ queryResult.data
  -- where
  --   writePurescriptFiles :: String -> Array Fernet.Introspection.IntrospectionSchema.TypeResult -> Aff Unit
  --   writePurescriptFiles dir objectTypes = do
  --     _ <- parTraverse (writePurescriptFile dir) objectTypes
  --     pure unit

  --   writePurescriptFile :: String -> Fernet.Introspection.IntrospectionSchema.TypeResult -> Aff Unit
  --   writePurescriptFile dir object = do
  --     case object.name of
  --       Just name -> writeTextFile UTF8 (dir <> "/" <> name <> ".purs") $ generateForObject object
  --       Nothing -> pure unit

  --   generateForObject :: Fernet.Introspection.IntrospectionSchema.TypeResult -> String
  --   generateForObject object = case object.name of
  --     Just name ->
  --       "module Text."
  --         <> name
  --         <> generateForFields name object.fields
  --     Nothing -> ""

  --   generateForFields :: String -> Maybe (Array Fernet.Introspection.IntrospectionSchema.FieldResult) -> String
  --   generateForFields onObject = case _ of
  --     Just fields -> joinWith "\n" ((generateForField onObject) <$> fields)
  --     Nothing -> ""

  --   generateForField :: String -> Fernet.Introspection.IntrospectionSchema.FieldResult -> String
  --   generateForField onObject field =
  --     field.name
  --       <> " :: SelectionSet ("
  --       <> field.name
  --       <> " :: ?) "
  --       <> onObject

  --   onlyObjects :: (Record Fernet.Introspection.IntrospectionSchema.Result) -> Array Fernet.Introspection.IntrospectionSchema.TypeResult
  --   onlyObjects result = filter (\t -> t.kind == Fernet.Introspection.Schema.TypeKind.Object) result.__schema.types

  --   objectNames :: Array Fernet.Introspection.IntrospectionSchema.TypeResult -> Array (Maybe String)
  --   objectNames = map _.name

  --   isSchemaObject :: forall a. { name :: Maybe String | a } -> Boolean
  --   isSchemaObject object = case object.name of
  --     Just name -> (take 2 name) == "__"
  --     Nothing -> false