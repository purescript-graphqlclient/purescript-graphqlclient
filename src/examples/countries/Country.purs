module Fernet.Example.Countries.Country where

import Data.Maybe (Maybe)
import Fernet.Example.Countries.Types (Country, Continent, Language)
import Fernet.GraphQL.SelectionSet (SelectionSet(..), noArgs, RawField(..))
import Type.Data.Row (RProxy(..))

code :: SelectionSet (code :: Maybe String) Country
code = noArgs "code"

name :: SelectionSet (name :: Maybe String) Country
name = noArgs "name"

native :: SelectionSet (native :: Maybe String) Country
native = noArgs "native"

phone :: SelectionSet (phone :: Maybe String) Country
phone = noArgs "phone"

currency :: SelectionSet (currency :: Maybe String) Country
currency = noArgs "phone"

emoji :: SelectionSet (emoji :: Maybe String) Country
emoji = noArgs "emoji"

emojiU :: SelectionSet (emojiU :: Maybe String) Country
emojiU = noArgs "emojiU"

continent ::
  forall r.
  SelectionSet r Continent ->
  SelectionSet (continent :: Record r) Country
continent (SelectionSet fields _) =
 SelectionSet
   [Composite "continent" [] fields] RProxy

languages ::
  forall r.
  SelectionSet r Language ->
  SelectionSet (languages :: Array (Record r)) Country
languages (SelectionSet fields _) =
  SelectionSet
    [Composite "languages" [] fields] RProxy
