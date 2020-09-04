module MyTest.IntrospectionSpec where

import Protolude (Either(..), Unit, bind, discard, error, for_, pure, throwError, (#), ($), (<<<), (>>=), (>>>), (\/))

import Affjax as Affjax
import Data.Argonaut.Core (Json)
import Data.Argonaut.Decode (JsonDecodeError, printJsonDecodeError)
import Data.Argonaut.Encode (encodeJson) as ArgonautCodecs.Encode
import GraphqlClient as GraphqlClient
import GraphqlClientGenerator.IntrospectionSchema as GraphqlClientGenerator.IntrospectionSchema
import Test.Spec as Test.Spec
import Test.Spec.Assertions (shouldEqual)
import Test.GraphqlRequest (request)
import Test.Json (jsonShouldEqual)
import Test.IntrospectionQuery as Test.IntrospectionQuery

urls :: Array String
urls =
  [ "http://elm-graphql-normalize.herokuapp.com/"
  , "https://countries.trevorblades.com/"
  , "https://swapi.graph.cool/"
  , "https://swapi-graphql.netlify.app/.netlify/functions/index" -- https://graphql.org/swapi-graphql/
  ]

introspectionQuery :: GraphqlClient.SelectionSet GraphqlClient.Scope__RootQuery GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQuery = GraphqlClientGenerator.IntrospectionSchema.introspectionQuery false

introspectionQueryString :: String
introspectionQueryString = GraphqlClient.writeGraphql introspectionQuery

introspectionQueryDecoder :: Json -> Either JsonDecodeError GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoder = GraphqlClient.getSelectionSetDecoder introspectionQuery

spec :: Test.Spec.Spec Unit
spec = Test.Spec.describe "Introspection spec" $ Test.Spec.parallel $ for_ urls (\url -> Test.Spec.it url do
  (expectedJson :: Json) <- request Test.IntrospectionQuery.introspectionQuery url { }
  (expectedParsed :: GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <- introspectionQueryDecoder expectedJson # (throwError <<< error <<< printJsonDecodeError) \/ pure

  (actualJson :: Json) <- GraphqlClient.post url [] (ArgonautCodecs.Encode.encodeJson { query: introspectionQueryString })
    >>= (throwError <<< error <<< Affjax.printError) \/ (\response -> pure response.body)
    >>= (GraphqlClient.tryDecodeGraphqlResponse Right >>> pure)
    >>= (throwError <<< error <<< GraphqlClient.printGraphqlError) \/ pure

  (actualParsed :: GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <- introspectionQueryDecoder actualJson # (throwError <<< error <<< printJsonDecodeError) \/ pure

  actualJson `jsonShouldEqual` expectedJson
  actualParsed `shouldEqual` expectedParsed
)
