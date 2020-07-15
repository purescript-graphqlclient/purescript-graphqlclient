module Examples.MyTests.Example06Typename where

import Examples.MyTests.Util
import GraphqlClient
import Protolude

import Data.Generic.Rep.Show (genericShow)
import Examples.Swapi.Object.Droid as Examples.Swapi.Object.Droid
import Examples.Swapi.Object.Human as Examples.Swapi.Object.Human
import Examples.Swapi.Query as Examples.Swapi.Query
import Examples.Swapi.Union.CharacterUnion as Examples.Swapi.Union.CharacterUnion
import Examples.Swapi.Interface.Character as Examples.Swapi.Interface.Character
import Examples.Swapi.Scopes
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

nonExhaustiveFragment :: SelectionSet Scope__CharacterUnion (Maybe String)
nonExhaustiveFragment = Examples.Swapi.Union.CharacterUnion.fragments $ Examples.Swapi.Union.CharacterUnion.maybeFragments
  { onHuman = Examples.Swapi.Object.Human.name <#> Just
  }

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
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" query

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual`
    { heroUnion: Human
    , heroInterface:
      { name: "Luke Skywalker"
      , details: Human
      }
    }
