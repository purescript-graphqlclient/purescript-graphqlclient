module Examples.Github.Interface.RequirableByPullRequest where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphQLArguments
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scalars (Id)
import Type.Row (type (+))
import Examples.Github.Scopes
  (Scope__RequirableByPullRequest, Scope__CheckRun, Scope__StatusContext)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type IsRequiredInputRowOptional r
  = ( pullRequestId :: Optional Id, pullRequestNumber :: Optional Int | r )

type IsRequiredInput = { | IsRequiredInputRowOptional + () }

isRequired
  :: IsRequiredInput
  -> SelectionSet Scope__RequirableByPullRequest Boolean
isRequired input = selectionForField
                   "isRequired"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onCheckRun :: SelectionSet Scope__CheckRun decodesTo
    , onStatusContext :: SelectionSet Scope__StatusContext decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__RequirableByPullRequest decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "CheckRun" selections.onCheckRun
                       , buildFragment
                         "StatusContext"
                         selections.onStatusContext
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onCheckRun: pure Nothing, onStatusContext: pure Nothing }
