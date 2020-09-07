module MyExamplesTests.Example05InterfacesAndUnions where

import MyExamplesTests.Util (inlineAndTrim)
import GraphqlClient (GraphqlError, Scope__RootQuery, SelectionSet, defaultInput, graphqlQueryRequest, printGraphqlError, writeGraphql)
import Protolude

import Data.Generic.Rep.Show (genericShow)
import Examples.Swapi.Object.Droid as Examples.Swapi.Object.Droid
import Examples.Swapi.Object.Human as Examples.Swapi.Object.Human
import Examples.Swapi.Query as Examples.Swapi.Query
import Examples.Swapi.Union.CharacterUnion as Examples.Swapi.Union.CharacterUnion
import Examples.Swapi.Interface.Character as Examples.Swapi.Interface.Character
import Examples.Swapi.Scopes (Scope__Character, Scope__CharacterUnion)
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response =
  { heroUnion :: HumanOrDroidDetails
  , heroInterface :: HumanOrDroidWithName
  , nonExhaustiveFragment :: Maybe String
  }

type HumanOrDroidWithName =
  { name :: String
  , details :: HumanOrDroidDetails
  }

data HumanOrDroidDetails
  = HumanDetails (Maybe String)
  | DroidDetails (Maybe String)

derive instance eqHumanOrDroidDetails :: Eq HumanOrDroidDetails
derive instance genericHumanOrDroidDetails :: Generic HumanOrDroidDetails _

instance showHumanOrDroidDetails :: Show HumanOrDroidDetails where show = genericShow

heroUnionSelection :: SelectionSet Scope__CharacterUnion HumanOrDroidDetails
heroUnionSelection =
  Examples.Swapi.Union.CharacterUnion.fragments
    { onDroid: Examples.Swapi.Object.Droid.primaryFunction <#> DroidDetails
    , onHuman: Examples.Swapi.Object.Human.homePlanet <#> HumanDetails
    }

heroSelection :: SelectionSet Scope__Character HumanOrDroidWithName
heroSelection =
  { name: _, details: _ }
    <$> Examples.Swapi.Interface.Character.name
    <*> (Examples.Swapi.Interface.Character.fragments
      { onDroid: Examples.Swapi.Object.Droid.primaryFunction <#> DroidDetails
      , onHuman: Examples.Swapi.Object.Human.homePlanet <#> HumanDetails
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
  , nonExhaustiveFragment: _
  }
  <$> Examples.Swapi.Query.heroUnion defaultInput heroUnionSelection
  <*> Examples.Swapi.Query.hero defaultInput heroSelection
  <*> Examples.Swapi.Query.heroUnion defaultInput nonExhaustiveFragment

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  heroUnion {
    __typename
    ...on Droid {
      primaryFunction
    }
    ...on Human {
      homePlanet
    }
  }
  hero {
    __typename
    name
    ...on Droid {
      primaryFunction
    }
    ...on Human {
      homePlanet
    }
  }
  heroUnion {
    __typename
    ...on Human {
      name
    }
  }
}
"""

-- | query {
-- |   heroUnion {
-- |     __typename
-- |     ...on Human {
-- |       homePlanet12867311: homePlanet
-- |     }
-- |     ...on Droid {
-- |       primaryFunction12867311: primaryFunction
-- |     }
-- |   }
-- |   hero {
-- |     name3832528868: name
-- |     __typename
-- |     ...on Human {
-- |       homePlanet12867311: homePlanet
-- |     }
-- |     ...on Droid {
-- |       primaryFunction12867311: primaryFunction
-- |     }
-- |   }
-- |   heroUnion {
-- |     __typename
-- |     ...on Human {
-- |       homePlanet12867311: homePlanet
-- |     }
-- |     ...on Droid {
-- |       __typename
-- |     }
-- |   }
-- | }

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example05InterfacesAndUnions" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" [] query

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual`
    { heroUnion: HumanDetails (Just "Tatooine")
    , heroInterface:
      { name: "Luke Skywalker"
      , details: HumanDetails (Just "Tatooine")
      }
    , nonExhaustiveFragment: Just "Luke Skywalker"
    }
