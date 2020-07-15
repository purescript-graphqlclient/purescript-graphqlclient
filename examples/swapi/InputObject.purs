module Examples.Swapi.InputObject where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Swapi.Scopes
import Examples.SwapiCustomScalars
import Examples.Swapi.Enum.Episode
import Examples.Swapi.Enum.Language
import Examples.Swapi.Enum.Phrase

-- | original name - Greeting
type Greeting = { language :: Optional Language
                , name :: String
                , options :: Optional GreetingOptions
                }

-- | original name - GreetingOptions
type GreetingOptions = { prefix :: Optional String
                       }
