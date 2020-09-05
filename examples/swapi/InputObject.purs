module Examples.Swapi.InputObject where

import GraphqlClient (Optional)
import Examples.Swapi.Enum.Language (Language)

-- | original name - Greeting
type Greeting = { language :: Optional
                              Language
                , name :: String
                , options :: Optional GreetingOptions
                }

-- | original name - GreetingOptions
type GreetingOptions = { prefix :: Optional String }
