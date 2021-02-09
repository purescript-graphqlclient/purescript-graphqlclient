module Examples.Github.Interface.Labelable where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.InputObject (LabelOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Scopes
  (Scope__LabelConnection, Scope__Labelable, Scope__Issue, Scope__PullRequest)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type LabelsInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.LabelOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type LabelsInput = { | LabelsInputRowOptional + () }

labels
  :: forall r
   . LabelsInput
  -> SelectionSet Scope__LabelConnection r
  -> SelectionSet Scope__Labelable (Maybe r)
labels input = selectionForCompositeField
               "labels"
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
  -> SelectionSet Scope__Labelable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Issue" selections.onIssue
                       , buildFragment "PullRequest" selections.onPullRequest
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onIssue: pure Nothing, onPullRequest: pure Nothing }
