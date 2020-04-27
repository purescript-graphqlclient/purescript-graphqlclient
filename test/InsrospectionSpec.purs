module Test.InsrospectionSpec where

import Protolude

import Affjax (post) as Affjax
import Affjax (printError)
import Affjax.RequestBody (json) as Affjax.RequestBody
import Affjax.ResponseFormat (json) as Affjax.ResponseFormat
import Ansi.Codes as Ansi.Codes
import Data.Argonaut.Core (Json, stringify)
import Data.Argonaut.Encode (encodeJson) as ArgonautCodecs
import Data.Either (Either)
import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Debug.Trace (traceM)
import Effect.Aff.Compat (EffectFnAff(..), fromEffectFnAff)
import Effect.Class.Console (log)
import Effect.Exception (error)
import Effect.Uncurried (EffectFn2)
import Fernet.GraphQL.WriteGraphQL as Fernet.GraphQL.WriteGraphQL
import Fernet.HTTP (gqlRequestImpl, printGraphqlError)
import Fernet.Introspection.IntrospectionSchema (introspectionQuery) as Fernet.Introspection.IntrospectionSchema
import Test.Spec as Test.Spec
import Test.Spec.Assertions (fail, shouldEqual)

foreign import _jsonDiffString :: Fn2 Json Json String

jsonDiffString :: Json → Json → String
jsonDiffString = runFn2 _jsonDiffString

foreign import introspectionQueryForGraphqlClient :: String

foreign import _requestGraphqlUsingGraphqlClient :: Fn3 String String Boolean (EffectFnAff Json)

requestGraphqlUsingGraphqlClient :: String -> String -> Boolean -> Aff Json
requestGraphqlUsingGraphqlClient query graphqlUrl includeDeprecated = runFn3 _requestGraphqlUsingGraphqlClient query graphqlUrl includeDeprecated # fromEffectFnAff

jsonShouldEqual :: Json -> Json -> Aff Unit
jsonShouldEqual x y = when (not $ eq x y) do
  let removeRed = Ansi.Codes.escapeCodeToString (Ansi.Codes.Graphics (pure Ansi.Codes.Reset))
  fail $ "Json are not equal\n\n" <> removeRed <> jsonDiffString x y

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Introspection spec" do
  let
    url :: String
    -- url = "http://elm-graphql-normalize.herokuapp.com/"
    -- url = "https://countries.trevorblades.com/"
    -- url = "https://swapi.graph.cool/"
    url = "https://swapi-graphql.netlify.app/.netlify/functions/index" -- https://graphql.org/swapi-graphql/

    query :: String
    query = Fernet.GraphQL.WriteGraphQL.writeGQL $ Fernet.Introspection.IntrospectionSchema.introspectionQuery includeDeprecated

    includeDeprecated = false

  expectedJson <- requestGraphqlUsingGraphqlClient introspectionQueryForGraphqlClient url includeDeprecated

  (actualJson :: Json) <- gqlRequestImpl url query
    >>= (throwError <<< error <<< printGraphqlError) \/ (\(x :: { data :: Json }) -> pure x.data)

  -- traceM expectedJson
  traceM actualJson

  actualJson `jsonShouldEqual` expectedJson
