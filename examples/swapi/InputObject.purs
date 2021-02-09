module Examples.Swapi.InputObject where

import GraphQLClient
  (Optional, class ToGraphQLArgumentValue, toGraphQLArgumentValue)
import Examples.Swapi.Enum.Language (Language)
import Data.Generic.Rep (class Generic)
import Data.Newtype (class Newtype)

-- | original name - Greeting
newtype Greeting
  = Greeting
    { language :: Optional Language
    , name :: String
    , options :: Optional GreetingOptions
    }

derive instance genericGreeting :: Generic Greeting _

derive instance newtypeGreeting :: Newtype Greeting _

instance toGraphQLArgumentValueGreeting :: ToGraphQLArgumentValue Greeting where
  toGraphQLArgumentValue (Greeting x) = toGraphQLArgumentValue x

-- | original name - GreetingOptions
newtype GreetingOptions = GreetingOptions { prefix :: Optional String }

derive instance genericGreetingOptions :: Generic GreetingOptions _

derive instance newtypeGreetingOptions :: Newtype GreetingOptions _

instance toGraphQLArgumentValueGreetingOptions
  :: ToGraphQLArgumentValue GreetingOptions where
  toGraphQLArgumentValue (GreetingOptions x) = toGraphQLArgumentValue x
