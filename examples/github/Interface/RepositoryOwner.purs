module Examples.Github.Interface.RepositoryOwner where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphQLArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__RepositoryOwner
  , Scope__RepositoryConnection
  , Scope__Repository
  , Scope__Organization
  , Scope__User
  )
import Examples.Github.Scalars (Uri, Id)
import Examples.Github.Enum.RepositoryPrivacy (RepositoryPrivacy)
import Examples.Github.InputObject (RepositoryOrder) as Examples.Github.InputObject
import Data.Maybe (Maybe(..))
import Examples.Github.Enum.RepositoryAffiliation (RepositoryAffiliation)
import Prelude (pure)

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__RepositoryOwner Uri
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RepositoryOwner Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__RepositoryOwner String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

type RepositoriesInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
                                      , orderBy :: Optional
                                                   Examples.Github.InputObject.RepositoryOrder
                                      , affiliations :: Optional
                                                        (Array
                                                         (Maybe
                                                          RepositoryAffiliation))
                                      , ownerAffiliations :: Optional
                                                             (Array
                                                              (Maybe
                                                               RepositoryAffiliation))
                                      , isLocked :: Optional Boolean
                                      , after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      , isFork :: Optional Boolean
                                      | r
                                      )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories :: forall r . RepositoriesInput -> SelectionSet
                                                Scope__RepositoryConnection
                                                r -> SelectionSet
                                                     Scope__RepositoryOwner
                                                     r
repositories input = selectionForCompositeField
                     "repositories"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryInputRowRequired r = ( name :: String | r )

type RepositoryInput = { | RepositoryInputRowRequired + () }

repository :: forall r . RepositoryInput -> SelectionSet
                                            Scope__Repository
                                            r -> SelectionSet
                                                 Scope__RepositoryOwner
                                                 (Maybe
                                                  r)
repository input = selectionForCompositeField
                   "repository"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__RepositoryOwner Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__RepositoryOwner Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onOrganization :: SelectionSet
                                               Scope__Organization
                                               decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__RepositoryOwner
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onUser: pure Nothing }
