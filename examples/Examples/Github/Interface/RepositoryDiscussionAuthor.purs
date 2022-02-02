module Examples.Github.Interface.RepositoryDiscussionAuthor where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.InputObject (DiscussionOrder) as Examples.Github.InputObject
import Examples.Github.Scalars (Id)
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__DiscussionConnection
  , Scope__RepositoryDiscussionAuthor
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type RepositoryDiscussionsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.DiscussionOrder
    , repositoryId :: Optional Id
    , answered :: Optional Boolean
    | r
    )

type RepositoryDiscussionsInput
  = { | RepositoryDiscussionsInputRowOptional + () }

repositoryDiscussions
  :: forall r
   . RepositoryDiscussionsInput
  -> SelectionSet Scope__DiscussionConnection r
  -> SelectionSet Scope__RepositoryDiscussionAuthor r
repositoryDiscussions input = selectionForCompositeField
                              "repositoryDiscussions"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type Fragments decodesTo
  = { onOrganization :: SelectionSet Scope__Organization decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__RepositoryDiscussionAuthor decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onUser: pure Nothing }
