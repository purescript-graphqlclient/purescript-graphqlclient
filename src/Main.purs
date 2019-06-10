module Main where

import Prelude
import Data.Either (Either(..))
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (logShow)
import Fernet.Example.Countries.Continent as Continent
import Fernet.Example.Countries.Country as Country
import Fernet.Example.Countries.Query (continent, continents)
import Fernet.GraphQL.SelectionSet ((<|>), SelectionSet, RootQuery)
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Fernet.HTTP (gqlRequest)

type Result
  = ( continent ::
      { code :: String
      }
  , continents ::
      Array
        { code :: String
        , countries ::
            Array
              { name :: Maybe String
              }
        , name :: String
        }
  )

query :: SelectionSet Result RootQuery
query =
  continents
    ( Continent.code
      <|> Continent.name
      <|> Continent.countries Country.name
    )
    <|> continent "na" Continent.code

main :: Effect Unit
main =
  launchAff_ do
    logShow $ writeGQL query
    resp <- gqlRequest "https://countries.trevorblades.com/" query
    case resp of
      Left e -> logShow e
      Right queryResult -> logShow queryResult
