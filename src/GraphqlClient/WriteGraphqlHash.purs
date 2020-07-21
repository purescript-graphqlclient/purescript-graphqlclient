module GraphqlClient.WriteGraphqlHash where

import Protolude

import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmptyArray
import Data.Hashable as Hashable
import Data.Int as Int
import Data.String as String
import GraphqlClient.Argument

hashString :: String -> String
hashString = String.replaceAll (String.Pattern "-") (String.Replacement "") <<< show <<< Hashable.hash

type Cache = Maybe { argsWritten :: String, hash :: String }

argsHash :: Array Argument -> Cache
argsHash args =
  case args of
       [] -> Nothing
       args' ->
         let
           argsWritten :: String
           argsWritten = writeGraphqlArguments args'

           hash :: String
           hash = hashString argsWritten
        in Just { argsWritten, hash }

-------------------------

writeGraphqlArguments :: Array Argument -> String
writeGraphqlArguments [] = ""
writeGraphqlArguments args =
  let args' = String.joinWith ", " $ writeGraphqlArgumentsNameVal <$> args
   in if String.null args' then "" else "(" <> args' <> ")"

writeGraphqlArgumentsNameVal :: Argument -> String
writeGraphqlArgumentsNameVal (Argument name value) = name <> ": " <> writeGraphqlArgumentsArgumentValue value

writeGraphqlArgumentsArgumentValue :: ArgumentValue -> String
writeGraphqlArgumentsArgumentValue = case _ of
  ArgumentValueString s -> "\"" <> s <> "\""
  ArgumentValueInt i -> Int.toStringAs Int.decimal i
  ArgumentValueBoolean b -> if b then "true" else "false"
  ArgumentValueMaybe maybeArg -> maybe "null" writeGraphqlArgumentsArgumentValue maybeArg
  ArgumentValueArray [] -> "[]"
  ArgumentValueArray argsArray -> "[" <> (String.joinWith ", " $ map writeGraphqlArgumentsArgumentValue argsArray) <> "]"
  ArgumentValueObject arguments -> writeGraphqlArgumentsArray arguments

writeGraphqlArgumentsArray :: Array Argument -> String
writeGraphqlArgumentsArray [] = ""
writeGraphqlArgumentsArray args =
  let args' = String.joinWith ", " $ writeGraphqlArgumentsNameVal <$> args
    in if String.null args' then "" else "{ " <> args' <> " }"
