module Dillonkearns.Examples.Github.Object.Status where

import Dillonkearns.GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Scopes
  ( Scope__StatusCheckRollupContextConnection
  , Scope__Status
  , Scope__Commit
  , Scope__StatusContext
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Id)
import Dillonkearns.Examples.Github.Enum.StatusState (StatusState)

type CombinedContextsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type CombinedContextsInput = { | CombinedContextsInputRowOptional + () }

combinedContexts
  :: forall r
   . CombinedContextsInput
  -> SelectionSet Scope__StatusCheckRollupContextConnection r
  -> SelectionSet Scope__Status r
combinedContexts input = selectionForCompositeField
                         "combinedContexts"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__Status (Maybe r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ContextInputRowRequired r = ( name :: String | r )

type ContextInput = { | ContextInputRowRequired + () }

context
  :: forall r
   . ContextInput
  -> SelectionSet Scope__StatusContext r
  -> SelectionSet Scope__Status (Maybe r)
context input = selectionForCompositeField
                "context"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

contexts
  :: forall r
   . SelectionSet Scope__StatusContext r
  -> SelectionSet Scope__Status (Array r)
contexts = selectionForCompositeField
           "contexts"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Status Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__Status StatusState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder
