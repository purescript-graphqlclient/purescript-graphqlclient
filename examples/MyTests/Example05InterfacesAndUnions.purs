module Examples.MyTests.Example05InterfacesAndUnions where

import Examples.MyTests.Util
import GraphqlClient
import Protolude

import Data.Generic.Rep.Show (genericShow)
import Swapi.Object.Droid as Droid
import Swapi.Object.Human as Human
import Swapi.Query as Query
import Swapi.Union.CharacterUnion as CharacterUnion
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response =
  { heroUnion :: HumanOrDroidDetails
  -- | , heroInterface :: HumanOrDroidWithName
  -- | , nonExhaustiveFragment :: Maybe String
  }

data HumanOrDroidDetails
  = HumanDetails (Maybe String)
  | DroidDetails (Maybe String)

derive instance eqHumanOrDroidDetails :: Eq HumanOrDroidDetails
derive instance genericHumanOrDroidDetails :: Generic HumanOrDroidDetails _

instance showHumanOrDroidDetails :: Show HumanOrDroidDetails where show = genericShow

heroUnionSelection :: SelectionSet CharacterUnion.Scope__CharacterUnion HumanOrDroidDetails
heroUnionSelection =
  CharacterUnion.fragments
    { onHuman: Human.homePlanet <#> HumanDetails
    , onDroid: Droid.primaryFunction <#> DroidDetails
    }

query :: SelectionSet Scope__RootQuery Response
query = { heroUnion: _ } <$> Query.heroUnion defaultInput heroUnionSelection

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

  response' `Test.Spec.shouldEqual` { heroUnion: HumanDetails (Just "Tatooine") }
