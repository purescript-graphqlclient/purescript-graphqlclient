module MyExamplesTests.Example06Typename where

import MyExamplesTests.Util (inlineAndTrim)
import GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultInput, graphqlQueryRequest, printGraphQLError, writeGraphQL)
import Protolude

import Data.Generic.Rep.Show (genericShow)
import Examples.Swapi.Query as Examples.Swapi.Query
import Examples.Swapi.Union.CharacterUnion as Examples.Swapi.Union.CharacterUnion
import Examples.Swapi.Interface.Character as Examples.Swapi.Interface.Character
import Examples.Swapi.Scopes (Scope__Character, Scope__CharacterUnion)
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response =
  { heroUnion :: HumanOrDroid
  , heroInterface :: HumanOrDroidWithName
  }

type HumanOrDroidWithName =
  { name :: String
  , details :: HumanOrDroid
  }

data HumanOrDroid
  = Human
  | Droid

derive instance eqHumanOrDroid :: Eq HumanOrDroid
derive instance genericHumanOrDroid :: Generic HumanOrDroid _

instance showHumanOrDroid :: Show HumanOrDroid where show = genericShow

heroUnionSelection :: SelectionSet Scope__CharacterUnion HumanOrDroid
heroUnionSelection =
  Examples.Swapi.Union.CharacterUnion.fragments
    { onHuman: pure Human
    , onDroid: pure Droid
    }

heroSelection :: SelectionSet Scope__Character HumanOrDroidWithName
heroSelection =
  { name: _, details: _ }
    <$> Examples.Swapi.Interface.Character.name
    <*> (Examples.Swapi.Interface.Character.fragments
      { onHuman: pure Human
      , onDroid: pure Droid
      }
    )

query :: SelectionSet Scope__RootQuery Response
query =
  { heroUnion: _
  , heroInterface: _
  }
  <$> Examples.Swapi.Query.heroUnion defaultInput heroUnionSelection
  <*> Examples.Swapi.Query.hero defaultInput heroSelection

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  heroUnion {
    __typename
  }
  hero {
    __typename
    name
  }
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example06Typename" do
  writeGraphQL query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" [] query

  (response' :: Response) <- (throwError <<< error <<< printGraphQLError) \/ pure $ response

  response' `Test.Spec.shouldEqual`
    { heroUnion: Human
    , heroInterface:
      { name: "Luke Skywalker"
      , details: Human
      }
    }
