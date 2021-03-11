module Examples.Github.Object.RepositoryInvitation where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__RepositoryInvitation, Scope__User, Scope__RepositoryInfo)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id, Uri)
import Examples.Github.Enum.RepositoryPermission
  (RepositoryPermission)

email :: SelectionSet Scope__RepositoryInvitation (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RepositoryInvitation Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

invitee
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__RepositoryInvitation (Maybe r)
invitee = selectionForCompositeField
          "invitee"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

inviter
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__RepositoryInvitation r
inviter = selectionForCompositeField
          "inviter"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

permalink :: SelectionSet Scope__RepositoryInvitation Uri
permalink = selectionForField "permalink" [] graphqlDefaultResponseScalarDecoder

permission :: SelectionSet Scope__RepositoryInvitation RepositoryPermission
permission = selectionForField
             "permission"
             []
             graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__RepositoryInfo r
  -> SelectionSet Scope__RepositoryInvitation (Maybe r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
