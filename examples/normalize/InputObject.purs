module Examples.Normalize.InputObject where

import GraphQLClient (Optional)
import Examples.Normalize.Enum.Language (Language)

-- | original name - CircularOne
type CircularOne = { circularTwo :: Optional CircularTwo }

-- | original name - CircularTwo
type CircularTwo = { circularOne :: Optional CircularOne }

-- | original name - Greeting
type Greeting = { language :: Optional Language
                , name :: String
                , options :: Optional GreetingOptions
                }

-- | original name - GreetingOptions
type GreetingOptions = { prefix :: Optional String }

-- | original name - Recursive
type Recursive = { recursive :: Optional Recursive }

-- | original name - ReservedWord
type ReservedWord = { "type" :: String }
