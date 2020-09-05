module MyGeneratorTests.IntrospectionSpec where

import Affjax as Affjax
import Data.Argonaut.Core (Json)
import Data.Argonaut.Decode (JsonDecodeError, printJsonDecodeError)
import Data.Argonaut.Encode (encodeJson) as ArgonautCodecs.Encode
import Effect.Exception.Unsafe (unsafeThrow)
import GraphqlClient as GraphqlClient
import GraphqlClient.Implementation as GraphqlClient.Implementation
import GraphqlClientGenerator.IntrospectionSchema as GraphqlClientGenerator.IntrospectionSchema
import MyGeneratorTestUtils.GraphqlRequest (request)
import MyGeneratorTestUtils.IntrospectionQuery as MyGeneratorTestUtils.IntrospectionQuery
import MyGeneratorTestUtils.Json (jsonShouldEqual)
import Protolude (Either(..), Unit, bind, discard, error, for_, pure, throwError, (#), ($), (<<<), (>>=), (>>>), (\/))
import Test.Spec as Test.Spec
import Test.Spec.Assertions (shouldEqual)

urls :: Array String
urls =
  [ "http://elm-graphql-normalize.herokuapp.com/"
  , "https://countries.trevorblades.com/"
  , "https://swapi.graph.cool/"
  , "https://swapi-graphql.netlify.app/.netlify/functions/index" -- https://graphql.org/swapi-graphql/
  ]

includeDeprecated :: Boolean
includeDeprecated = false

introspectionQueryString :: String
introspectionQueryString = GraphqlClient.writeGraphql (GraphqlClientGenerator.IntrospectionSchema.introspectionQuery (\_ _ -> unsafeThrow "I dont care about decoder") includeDeprecated)

introspectionQueryDecoderForExternalJson :: Json -> Either JsonDecodeError GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoderForExternalJson = GraphqlClient.getSelectionSetDecoder (GraphqlClientGenerator.IntrospectionSchema.introspectionQuery GraphqlClient.Implementation.fieldNameWithoutHash includeDeprecated)

introspectionQueryDecoderForJsonFromOurLibGeneratedQuery :: Json -> Either JsonDecodeError GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoderForJsonFromOurLibGeneratedQuery = GraphqlClient.getSelectionSetDecoder (GraphqlClientGenerator.IntrospectionSchema.introspectionQuery GraphqlClient.Implementation.fieldNameWithHash includeDeprecated)

spec :: Test.Spec.Spec Unit
spec = Test.Spec.describe "Introspection spec" $ Test.Spec.parallel $ for_ urls (\url -> Test.Spec.it url do
  (expectedJson :: Json) <- request MyGeneratorTestUtils.IntrospectionQuery.introspectionQuery url { }
  (expectedParsed :: GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <- introspectionQueryDecoderForExternalJson expectedJson # (throwError <<< error <<< printJsonDecodeError) \/ pure

  (actualJson :: Json) <- GraphqlClient.post url [] (ArgonautCodecs.Encode.encodeJson { query: introspectionQueryString })
    >>= (throwError <<< error <<< Affjax.printError) \/ (\response -> pure response.body)
    >>= (GraphqlClient.tryDecodeGraphqlResponse Right >>> pure)
    >>= (throwError <<< error <<< GraphqlClient.printGraphqlError) \/ pure

  (actualParsed :: GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <- introspectionQueryDecoderForJsonFromOurLibGeneratedQuery actualJson # (throwError <<< error <<< printJsonDecodeError) \/ pure

  actualParsed `shouldEqual` expectedParsed
)
