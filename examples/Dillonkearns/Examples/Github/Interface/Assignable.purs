module Dillonkearns.Examples.Github.Interface.Assignable where

import Dillonkearns.GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Scopes
  (Scope__UserConnection, Scope__Assignable, Scope__Issue, Scope__PullRequest)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type AssigneesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type AssigneesInput = { | AssigneesInputRowOptional + () }

assignees
  :: forall r
   . AssigneesInput
  -> SelectionSet Scope__UserConnection r
  -> SelectionSet Scope__Assignable r
assignees input = selectionForCompositeField
                  "assignees"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type Fragments decodesTo
  = { onIssue :: SelectionSet Scope__Issue decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Assignable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Issue" selections.onIssue
                       , buildFragment "PullRequest" selections.onPullRequest
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onIssue: pure Nothing, onPullRequest: pure Nothing }
