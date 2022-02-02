module Examples.Github.Interface.ProjectNextOwner where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__ProjectNextOwner
  , Scope__ProjectNext
  , Scope__ProjectNextConnection
  , Scope__Issue
  , Scope__Organization
  , Scope__PullRequest
  , Scope__User
  )
import Examples.Github.Scalars (Id)
import Type.Row (type (+))
import Data.Maybe (Maybe(..))
import Examples.Github.Enum.ProjectNextOrderField (ProjectNextOrderField)
import Prelude (pure)

id :: SelectionSet Scope__ProjectNextOwner Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type ProjectNextInputRowRequired r = ( number :: Int | r )

type ProjectNextInput = { | ProjectNextInputRowRequired + () }

projectNext
  :: forall r
   . ProjectNextInput
  -> SelectionSet Scope__ProjectNext r
  -> SelectionSet Scope__ProjectNextOwner (Maybe r)
projectNext input = selectionForCompositeField
                    "projectNext"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsNextInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , query :: Optional String
    , sortBy :: Optional ProjectNextOrderField
    | r
    )

type ProjectsNextInput = { | ProjectsNextInputRowOptional + () }

projectsNext
  :: forall r
   . ProjectsNextInput
  -> SelectionSet Scope__ProjectNextConnection r
  -> SelectionSet Scope__ProjectNextOwner r
projectsNext input = selectionForCompositeField
                     "projectsNext"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type Fragments decodesTo
  = { onIssue :: SelectionSet Scope__Issue decodesTo
    , onOrganization :: SelectionSet Scope__Organization decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__ProjectNextOwner decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Issue" selections.onIssue
                       , buildFragment "Organization" selections.onOrganization
                       , buildFragment "PullRequest" selections.onPullRequest
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onIssue: pure
                            Nothing
                 , onOrganization: pure
                                   Nothing
                 , onPullRequest: pure
                                  Nothing
                 , onUser: pure
                           Nothing
                 }
