module Examples.Normalize.Query where

import Examples.Normalize.InputObject
  (CircularOne, Greeting, Recursive, ReservedWord) as Examples.Normalize.InputObject
import Type.Row (type (+))
import GraphQLClient
  ( SelectionSet
  , Scope__RootQuery
  , selectionForField
  , toGraphQLArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  )
import Data.Maybe (Maybe)
import Examples.Normalize.Scopes
  ( Scope__ConflictingTypesUnion
  , Scope__Droid
  , Scope__Character
  , Scope__CharacterUnion
  , Scope__Human
  )
import Examples.Normalize.Scalars (Id)
import Examples.Normalize.Enum.Episode (Episode)

type CircularInputInputRowRequired r
  = ( input :: Examples.Normalize.InputObject.CircularOne | r )

type CircularInputInput = { | CircularInputInputRowRequired + () }

circularInput
  :: CircularInputInput
  -> SelectionSet Scope__RootQuery (Maybe String)
circularInput input = selectionForField
                      "circularInput"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseScalarDecoder

conflictingTypesUnion
  :: forall r
   . SelectionSet Scope__ConflictingTypesUnion r
  -> SelectionSet Scope__RootQuery r
conflictingTypesUnion = selectionForCompositeField
                        "conflictingTypesUnion"
                        []
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DroidInputRowRequired r = ( "_iD" :: Id | r )

type DroidInput = { | DroidInputRowRequired + () }

_droid
  :: forall r
   . DroidInput
  -> SelectionSet Scope__Droid r
  -> SelectionSet Scope__RootQuery (Maybe r)
_droid input = selectionForCompositeField
               "_droid"
               (toGraphQLArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GreetInputRowRequired r
  = ( input :: Examples.Normalize.InputObject.Greeting | r )

type GreetInput = { | GreetInputRowRequired + () }

greet :: GreetInput -> SelectionSet Scope__RootQuery String
greet input = selectionForField
              "greet"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseScalarDecoder

type HeroInputRowOptional r = ( episode :: Optional Episode | r )

type HeroInput = { | HeroInputRowOptional + () }

hero
  :: forall r
   . HeroInput
  -> SelectionSet Scope__Character r
  -> SelectionSet Scope__RootQuery r
hero input = selectionForCompositeField
             "hero"
             (toGraphQLArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HeroUnionInputRowOptional r = ( episode :: Optional Episode | r )

type HeroUnionInput = { | HeroUnionInputRowOptional + () }

heroUnion
  :: forall r
   . HeroUnionInput
  -> SelectionSet Scope__CharacterUnion r
  -> SelectionSet Scope__RootQuery (Maybe r)
heroUnion input = selectionForCompositeField
                  "heroUnion"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HumanInputRowRequired r = ( id :: Id | r )

type HumanInput = { | HumanInputRowRequired + () }

human
  :: forall r
   . HumanInput
  -> SelectionSet Scope__Human r
  -> SelectionSet Scope__RootQuery (Maybe r)
human input = selectionForCompositeField
              "human"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RecursiveInputInputRowRequired r
  = ( input :: Examples.Normalize.InputObject.Recursive | r )

type RecursiveInputInput = { | RecursiveInputInputRowRequired + () }

recursiveInput
  :: RecursiveInputInput
  -> SelectionSet Scope__RootQuery (Maybe String)
recursiveInput input = selectionForField
                       "recursiveInput"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseScalarDecoder

type TypeInputRowOptional r
  = ( input :: Optional Examples.Normalize.InputObject.ReservedWord | r )

type TypeInput = { | TypeInputRowOptional + () }

type_ :: TypeInput -> SelectionSet Scope__RootQuery String
type_ input = selectionForField
              "type"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseScalarDecoder
