module Swapi.InputObject where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase

-- | original name - Greeting
type Greeting = { language :: Maybe Language
                , name :: String
                , options :: Maybe GreetingOptions
                }

-- | original name - GreetingOptions
type GreetingOptions = { prefix :: Maybe String
                       }
