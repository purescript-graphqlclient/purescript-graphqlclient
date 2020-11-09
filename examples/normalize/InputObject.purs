module Examples.Normalize.InputObject where

import GraphQLClient
  (Optional, class ToGraphQLArgumentValue, toGraphQLArgumentValue)
import Data.Generic.Rep (class Generic)
import Data.Newtype (class Newtype)
import Examples.Normalize.Enum.Language (Language)

-- | original name - CircularOne
newtype CircularOne = CircularOne { circularTwo :: Optional CircularTwo }

derive instance genericCircularOne :: Generic CircularOne _

derive instance newtypeCircularOne :: Newtype CircularOne _

instance toGraphQLArgumentValueCircularOne :: ToGraphQLArgumentValue CircularOne where
  toGraphQLArgumentValue (CircularOne x) = toGraphQLArgumentValue x

-- | original name - CircularTwo
newtype CircularTwo = CircularTwo { circularOne :: Optional CircularOne }

derive instance genericCircularTwo :: Generic CircularTwo _

derive instance newtypeCircularTwo :: Newtype CircularTwo _

instance toGraphQLArgumentValueCircularTwo :: ToGraphQLArgumentValue CircularTwo where
  toGraphQLArgumentValue (CircularTwo x) = toGraphQLArgumentValue x

-- | original name - Greeting
newtype Greeting = Greeting { language :: Optional Language
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

instance toGraphQLArgumentValueGreetingOptions :: ToGraphQLArgumentValue
                                                  GreetingOptions where
  toGraphQLArgumentValue (GreetingOptions x) = toGraphQLArgumentValue x

-- | original name - Recursive
newtype Recursive = Recursive { recursive :: Optional Recursive }

derive instance genericRecursive :: Generic Recursive _

derive instance newtypeRecursive :: Newtype Recursive _

instance toGraphQLArgumentValueRecursive :: ToGraphQLArgumentValue Recursive where
  toGraphQLArgumentValue (Recursive x) = toGraphQLArgumentValue x

-- | original name - ReservedWord
newtype ReservedWord = ReservedWord { "type" :: String }

derive instance genericReservedWord :: Generic ReservedWord _

derive instance newtypeReservedWord :: Newtype ReservedWord _

instance toGraphQLArgumentValueReservedWord :: ToGraphQLArgumentValue
                                               ReservedWord where
  toGraphQLArgumentValue (ReservedWord x) = toGraphQLArgumentValue x
