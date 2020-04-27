module Fernet.Example.Countries.Query where

import Data.Maybe (Maybe)
import Fernet.Example.Countries.Types (Language, Continent, Country)
import Fernet.Graphql.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), RootQuery, SelectionSet(..))
import Type.Data.Row (RProxy(..))

continents ::
  forall r.
  SelectionSet r Continent ->
  SelectionSet (continents :: Array (Record r)) RootQuery
continents (SelectionSet fields) =
  SelectionSet [Composite "continents" [] fields]

continent ::
  forall r.
  String ->
  SelectionSet r Continent ->
  SelectionSet (continent :: Maybe (Record r)) RootQuery
continent code (SelectionSet fields) =
  SelectionSet
    [
      Composite
        "continent"
        [RequiredArgument "code" (ArgString code)]
        fields
    ]


countries ::
  forall r.
  SelectionSet r Country ->
  SelectionSet (countries :: Array (Record r)) RootQuery
countries (SelectionSet fields) =
  SelectionSet [Composite "countries" [] fields]

country ::
  forall r.
  String ->
  SelectionSet r Country ->
  SelectionSet (country :: Maybe (Record r)) RootQuery
country code (SelectionSet fields) =
  SelectionSet
    [
      Composite
        "country"
        [RequiredArgument "code" (ArgString code)]
        fields
    ]


languages ::
  forall r.
  SelectionSet r Language ->
  SelectionSet (languages :: Array (Record r)) RootQuery
languages (SelectionSet fields) =
  SelectionSet [Composite "languages" [] fields]

language ::
  forall r.
  String ->
  SelectionSet r Language ->
  SelectionSet (language :: Maybe (Record r)) RootQuery
language code (SelectionSet fields) =
  SelectionSet
    [
      Composite
        "language"
        [RequiredArgument "code" (ArgString code)]
        fields
    ]

