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
import Fernet.Introspection.Schema.Query (schema)
import Fernet.Introspection.Schema.Schema (types)
import Fernet.Introspection.Schema.Type as Type
import Fernet.Introspection.Schema.Types (TypeKind)

query ::
  SelectionSet
    ( __schema ::
        { types ::
            Array
              { name :: String
              , kind :: TypeKind
              }
        }
    , continent ::
        Maybe
          { code :: Maybe String
          }
    , continents ::
        Array
          { code :: Maybe String
          , countries ::
              Array
                { name :: Maybe String
                }
          , name :: Maybe String
          }
    )
    RootQuery
query =
  continents
    ( Continent.code
      <|> Continent.name
      <|> Continent.countries Country.name
    )
    <|> continent "AF" Continent.code
    <|> schema (types (Type.name <|> Type.kind))

main :: Effect Unit
main =
  launchAff_ do
    logShow $ writeGQL query
    resp <- gqlRequest "https://countries.trevorblades.com/" query
    case resp of
      Left e -> logShow e
      Right queryResult -> logShow queryResult.data.__schema
