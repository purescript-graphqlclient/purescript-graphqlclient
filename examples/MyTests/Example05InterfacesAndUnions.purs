module Examples.MyTests.Example05InterfacesAndUnions where

import Examples.MyTests.Util
import GraphqlClient
import Protolude

import Data.Generic.Rep.Show (genericShow)
import Swapi.Object.Droid as Swapi.Object.Droid
import Swapi.Object.Human as Swapi.Object.Human
import Swapi.Query as Swapi.Query
import Swapi.Union.CharacterUnion as Swapi.Union.CharacterUnion
import Swapi.Interface.Character as Swapi.Interface.Character
import Swapi.Scopes
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
  Swapi.Union.CharacterUnion.fragments
    { onHuman: Swapi.Object.Human.homePlanet <#> HumanDetails
    , onDroid: Swapi.Object.Droid.primaryFunction <#> DroidDetails
    }

heroSelection :: SelectionSet Scope__CharacterInterface HumanOrDroidWithName
heroSelection =
  { name: _, details: _ }
    <$> Swapi.Interface.Character.name
    <*> (Swapi.Interface.Character.fragments
      { onHuman: Swapi.Object.Human.homePlanet <#> HumanDetails
      , onDroid: Swapi.Object.Droid.primaryFunction <#> DroidDetails
      }
    )

nonExhaustiveFragment :: SelectionSet Scope__CharacterUnion (Maybe String)
nonExhaustiveFragment = Swapi.Union.CharacterUnion.fragments $ Swapi.Union.CharacterUnion.maybeFragments
  { onHuman = Swapi.Object.Human.name <#> Just
  }

query :: SelectionSet Scope__RootQuery Response
query =
  { heroUnion: _
  , heroInterface: _
  , nonExhaustiveFragment: _
  }
  <$> Swapi.Query.heroUnion defaultInput heroUnionSelection
  <*> Swapi.Query.hero defaultInput heroSelection
  <*> Swapi.Query.heroUnion defaultInput nonExhaustiveFragment

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  heroUnion {
    __typename
    ...on Human {
      homePlanet
    }
    ...on Droid {
      primaryFunction
    }
  }
  hero {
    __typename
    name
    ...on Human {
      homePlanet
    }
    ...on Droid {
      primaryFunction
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

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" query

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual`
    { heroUnion: HumanDetails (Just "Tatooine")
    , heroInterface:
      { name: "Luke Skywalker"
      , details: HumanDetails (Just "Tatooine")
      }
    , nonExhaustiveFragment: Just "Luke Skywalker"
    }
