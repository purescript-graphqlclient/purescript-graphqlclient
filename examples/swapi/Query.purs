module Examples.Swapi.Query where

import Examples.SwapiCustomScalars (Id, PosixTime)
import Type.Row (type (+))
import GraphQLClient
  ( SelectionSet
  , Scope__RootQuery
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  )
import Examples.Swapi.Scopes
  (Scope__Droid, Scope__Character, Scope__CharacterUnion, Scope__Human)
import Data.Maybe (Maybe)
import Examples.Swapi.InputObject (Greeting) as Examples.Swapi.InputObject
import Examples.Swapi.Enum.Episode (Episode)

type DroidInputRowRequired r = ( id :: Id | r )

type DroidInput = { | DroidInputRowRequired + () }

droid :: forall r . DroidInput -> SelectionSet
                                  Scope__Droid
                                  r -> SelectionSet
                                       Scope__RootQuery
                                       (Maybe
                                        r)
droid input = selectionForCompositeField
              "droid"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

forcedError :: SelectionSet Scope__RootQuery (Maybe String)
forcedError = selectionForField
              "forcedError"
              []
              graphqlDefaultResponseScalarDecoder

type GreetInputRowRequired r = ( input :: Examples.Swapi.InputObject.Greeting
                               | r
                               )

type GreetInput = { | GreetInputRowRequired + () }

greet :: GreetInput -> SelectionSet Scope__RootQuery String
greet input = selectionForField
              "greet"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseScalarDecoder

hello :: SelectionSet Scope__RootQuery String
hello = selectionForField "hello" [] graphqlDefaultResponseScalarDecoder

type HeroInputRowOptional r = ( episode :: Optional Episode | r )

type HeroInput = { | HeroInputRowOptional + () }

hero :: forall r . HeroInput -> SelectionSet
                                Scope__Character
                                r -> SelectionSet
                                     Scope__RootQuery
                                     r
hero input = selectionForCompositeField
             "hero"
             (toGraphQLArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HeroUnionInputRowOptional r = ( episode :: Optional Episode | r )

type HeroUnionInput = { | HeroUnionInputRowOptional + () }

heroUnion :: forall r . HeroUnionInput -> SelectionSet
                                          Scope__CharacterUnion
                                          r -> SelectionSet
                                               Scope__RootQuery
                                               r
heroUnion input = selectionForCompositeField
                  "heroUnion"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HumanInputRowRequired r = ( id :: Id | r )

type HumanInput = { | HumanInputRowRequired + () }

human :: forall r . HumanInput -> SelectionSet
                                  Scope__Human
                                  r -> SelectionSet
                                       Scope__RootQuery
                                       (Maybe
                                        r)
human input = selectionForCompositeField
              "human"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

now :: SelectionSet Scope__RootQuery PosixTime
now = selectionForField "now" [] graphqlDefaultResponseScalarDecoder

today :: SelectionSet Scope__RootQuery String
today = selectionForField "today" [] graphqlDefaultResponseScalarDecoder
