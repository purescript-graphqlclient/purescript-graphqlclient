module Examples.MyTests.Example05InterfacesAndUnions where

import GraphqlClient (GraphqlError(..), GraphqlUserErrorDetail(..), PossiblyParsedData(..), Scope__RootQuery, SelectionSet, gqlRequest, writeGraphql)
import Protolude (Either(..), Maybe(..), Unit, bind, discard)
import Data.Array.NonEmpty as NonEmptyArray

import Swapi.Query as Query
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (fail, shouldEqual) as Test.Spec
import Examples.MyTests.Util

type Response = Maybe String

query :: SelectionSet Scope__RootQuery Response
query = Query.forcedError

expectedQuery :: String
expectedQuery = inlineAndTrim """
  query {
    heroUnion {
      __typename
      ...on Human {
        homePlanet12867311: homePlanet
      }
      ...on Droid {
        primaryFunction12867311: primaryFunction
      }
    }
    hero {
      name3832528868: name
      __typename
      ...on Human {
        homePlanet12867311: homePlanet
      }
      ...on Droid {
        primaryFunction12867311: primaryFunction
      }
    }
    heroUnion {
      __typename
      ...on Human {
        homePlanet12867311: homePlanet
      }
      ...on Droid {
        __typename
      }
    }
  }
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example05InterfacesAndUnions" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery
