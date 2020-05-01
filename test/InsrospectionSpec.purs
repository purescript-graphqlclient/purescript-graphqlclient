module Test.InsrospectionSpec where

import Protolude

import Affjax                                   as Affjax
import Affjax.RequestBody                       as Affjax.RequestBody
import Affjax.ResponseFormat                    as Affjax.ResponseFormat
import Ansi.Codes                               as Ansi.Codes
import Data.Argonaut.Core                       (Json)
import Data.Argonaut.Encode                     as ArgonautCodecs
import Data.Function.Uncurried                  (Fn2, Fn3, runFn2, runFn3)
import Effect.Aff.Compat                        (EffectFnAff(..), fromEffectFnAff)
import Effect.Exception                         (error)
import Fernet.Graphql.SelectionSet              (SelectionSet(..))
import Fernet.Graphql.WriteGraphql              as Fernet.Graphql.WriteGraphql
import Fernet.HTTP                              as Fernet.HTTP
import Fernet.Introspection.IntrospectionSchema as Fernet.Introspection.IntrospectionSchema
import Test.Spec                                as Test.Spec
import Test.Spec.Assertions                     (fail)

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
    query = Fernet.Graphql.WriteGraphql.writeGraphql $ Fernet.Introspection.IntrospectionSchema.introspectionQuery includeDeprecated

    -- decoder = let (SelectionSet fields decoder) = Fernet.Introspection.IntrospectionSchema.introspectionQuery includeDeprecated in decoder
    decoder = identity >>> pure

    includeDeprecated = false

  expectedJson <- requestGraphqlUsingGraphqlClient introspectionQueryForGraphqlClient url includeDeprecated

  (actualJson :: _) <- Fernet.HTTP.gqlRequestImpl url query decoder
    >>= (throwError <<< error <<< Fernet.HTTP.printGraphqlError) \/ pure

  -- traceM expectedJson
  traceM actualJson

  actualJson `jsonShouldEqual` expectedJson
