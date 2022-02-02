module Examples.Github.Interface.RepositoryDiscussionCommentAuthor where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scalars (Id)
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__DiscussionCommentConnection
  , Scope__RepositoryDiscussionCommentAuthor
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type RepositoryDiscussionCommentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , repositoryId :: Optional Id
    , onlyAnswers :: Optional Boolean
    | r
    )

type RepositoryDiscussionCommentsInput
  = { | RepositoryDiscussionCommentsInputRowOptional + () }

repositoryDiscussionComments
  :: forall r
   . RepositoryDiscussionCommentsInput
  -> SelectionSet Scope__DiscussionCommentConnection r
  -> SelectionSet Scope__RepositoryDiscussionCommentAuthor r
repositoryDiscussionComments input = selectionForCompositeField
                                     "repositoryDiscussionComments"
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
  -> SelectionSet Scope__RepositoryDiscussionCommentAuthor decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onUser: pure Nothing }
