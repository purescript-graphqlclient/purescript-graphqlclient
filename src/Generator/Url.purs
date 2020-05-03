module Generator.Url (Url, mkUrl, unUrl) where

import Protolude

import Data.Generic.Rep.Show (genericShow)
import Data.String.Regex (Regex, test) as Regex
import Data.String.Regex.Flags (noFlags) as Regex.Flags
import Data.String.Regex.Unsafe (unsafeRegex) as Regex

newtype Url = Url String

derive instance urlNewtype :: Newtype Url _
derive instance urlEq :: Eq Url
derive instance urlOrd :: Ord Url
derive instance urlGeneric :: Generic Url _
instance urlShow :: Show Url where show = genericShow

urlRegexString :: String
urlRegexString = """(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})"""

urlRegex :: Regex.Regex
urlRegex = Regex.unsafeRegex urlRegexString Regex.Flags.noFlags

mkUrl :: String -> Maybe Url
mkUrl string =
  if Regex.test urlRegex string
    then Just $ Url string
    else Nothing

unUrl :: Url -> String
unUrl (Url string) = string
