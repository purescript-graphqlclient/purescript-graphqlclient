module Examples.MyTests.Util where

import Data.String.Regex
import Data.String.Regex.Flags
import Data.String.Regex.Unsafe
import Protolude

import Data.String (trim)

inlineAndTrim :: String -> String
inlineAndTrim = trim <<< replace (unsafeRegex """\s+""" global) " "
