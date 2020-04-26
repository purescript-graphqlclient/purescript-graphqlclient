module Test.InsrospectionSpec where

import Protolude

import Affjax (post) as Affjax
import Affjax (printError)
import Affjax.RequestBody (json) as Affjax.RequestBody
import Affjax.ResponseFormat (json) as Affjax.ResponseFormat
import Data.Argonaut.Core (Json, stringify)
import Data.Argonaut.Encode (encodeJson) as ArgonautCodecs
import Data.Either (Either)
import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Debug.Trace (traceM)
import Effect.Aff.Compat (EffectFnAff(..), fromEffectFnAff)
import Effect.Exception (error)
import Effect.Uncurried (EffectFn2)
import Fernet.GraphQL.WriteGraphQL as Fernet.GraphQL.WriteGraphQL
import Fernet.HTTP (gqlRequestImpl, printGraphqlError)
import Main as Main
import Test.Spec as Test.Spec
import Test.Spec.Assertions (shouldEqual)

foreign import introspectionQueryForGraphqlClient :: String

foreign import _requestGraphqlUsingGraphqlClient :: Fn3 String String Boolean (EffectFnAff Json)

requestGraphqlUsingGraphqlClient :: String -> String -> Boolean -> Aff Json
requestGraphqlUsingGraphqlClient query graphqlUrl includeDeprecated = runFn3 _requestGraphqlUsingGraphqlClient query graphqlUrl includeDeprecated # fromEffectFnAff

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Introspection spec" do
  let
    url :: String
    url = "https://countries.trevorblades.com/"

    query :: String
    query = Fernet.GraphQL.WriteGraphQL.writeGQL Main.introspectionQuery

  expectedJson <- requestGraphqlUsingGraphqlClient introspectionQueryForGraphqlClient url true

  (actualJson :: Json) <- gqlRequestImpl url query
    >>= (throwError <<< error <<< printGraphqlError) \/ (\(x :: { data :: Json }) -> pure x.data)

  traceM expectedJson
  traceM actualJson

  stringify actualJson `shouldEqual` stringify expectedJson
