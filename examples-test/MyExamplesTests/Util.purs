module MyExamplesTests.Util where

import Data.String.Regex (replace)
import Data.String.Regex.Flags (global)
import Data.String.Regex.Unsafe (unsafeRegex)
import Prelude
import Data.String (trim)

inlineAndTrim :: String -> String
inlineAndTrim = trim <<< replace (unsafeRegex """\s+""" global) " "
