module Swapi.InputObject where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scopes
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase

-- | original name - Greeting
type Greeting = { language :: Optional Language
                , name :: String
                , options :: Optional GreetingOptions
                }

-- | original name - GreetingOptions
type GreetingOptions = { prefix :: Optional String
                       }
