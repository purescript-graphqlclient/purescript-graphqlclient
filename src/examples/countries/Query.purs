module Fernet.Example.Countries.Query where

import Fernet.Example.Countries.Types (Language, Continent, Country)
import Fernet.GraphQL.SelectionSet
  ( Argument(..)
  , ArgumentValue(..)
  , RawField(..)
  , RootQuery
  , SelectionSet(..)
  )
import Type.Data.Row (RProxy(..))

continents ::
  forall r.
  SelectionSet r Continent ->
  SelectionSet (continents :: Array (Record r)) RootQuery
continents (SelectionSet fields _) =
  SelectionSet [Composite "continents" [] fields] RProxy

continent ::
  forall r.
  String ->
  SelectionSet r Continent ->
  SelectionSet (continent :: Record r) RootQuery
continent code (SelectionSet fields _) =
  SelectionSet
    [
      Composite
        "continent"
        [RequiredArgument "code" (ArgString code)]
        fields
    ]
    RProxy

countries ::
  forall r.
  SelectionSet r Country ->
  SelectionSet (countries :: Array (Record r)) RootQuery
countries (SelectionSet fields _) =
  SelectionSet [Composite "countries" [] fields] RProxy

country ::
  forall r.
  String ->
  SelectionSet r Country ->
  SelectionSet (country :: Record r) RootQuery
country code (SelectionSet fields _) =
  SelectionSet
    [
      Composite
        "country"
        [RequiredArgument "code" (ArgString code)]
        fields
    ]
    RProxy

languages ::
  forall r.
  SelectionSet r Language ->
  SelectionSet (languages :: Array (Record r)) RootQuery
languages (SelectionSet fields _) =
  SelectionSet [Composite "languages" [] fields] RProxy

language ::
  forall r.
  String ->
  SelectionSet r Language ->
  SelectionSet (language :: Record r) RootQuery
language code (SelectionSet fields _) =
  SelectionSet
    [
      Composite
        "language"
        [RequiredArgument "code" (ArgString code)]
        fields
    ]
    RProxy
