module Examples.Github.Interface.RepositoryInfo where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphqlArguments
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__RepositoryInfo
  , Scope__License
  , Scope__RepositoryOwner
  , Scope__Repository
  )
import Examples.Github.Scalars (DateTime, Html, Uri)
import Data.Maybe (Maybe(..))
import Examples.Github.Enum.RepositoryLockReason (RepositoryLockReason)
import Type.Row (type (+))
import Prelude

createdAt :: SelectionSet Scope__RepositoryInfo DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__RepositoryInfo (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__RepositoryInfo Html
descriptionHTML = selectionForField
                  "descriptionHTML"
                  []
                  graphqlDefaultResponseScalarDecoder

forkCount :: SelectionSet Scope__RepositoryInfo Int
forkCount = selectionForField "forkCount" [] graphqlDefaultResponseScalarDecoder

hasIssuesEnabled :: SelectionSet Scope__RepositoryInfo Boolean
hasIssuesEnabled = selectionForField
                   "hasIssuesEnabled"
                   []
                   graphqlDefaultResponseScalarDecoder

hasProjectsEnabled :: SelectionSet Scope__RepositoryInfo Boolean
hasProjectsEnabled = selectionForField
                     "hasProjectsEnabled"
                     []
                     graphqlDefaultResponseScalarDecoder

hasWikiEnabled :: SelectionSet Scope__RepositoryInfo Boolean
hasWikiEnabled = selectionForField
                 "hasWikiEnabled"
                 []
                 graphqlDefaultResponseScalarDecoder

homepageUrl :: SelectionSet Scope__RepositoryInfo (Maybe Uri)
homepageUrl = selectionForField
              "homepageUrl"
              []
              graphqlDefaultResponseScalarDecoder

isArchived :: SelectionSet Scope__RepositoryInfo Boolean
isArchived = selectionForField
             "isArchived"
             []
             graphqlDefaultResponseScalarDecoder

isFork :: SelectionSet Scope__RepositoryInfo Boolean
isFork = selectionForField "isFork" [] graphqlDefaultResponseScalarDecoder

isLocked :: SelectionSet Scope__RepositoryInfo Boolean
isLocked = selectionForField "isLocked" [] graphqlDefaultResponseScalarDecoder

isMirror :: SelectionSet Scope__RepositoryInfo Boolean
isMirror = selectionForField "isMirror" [] graphqlDefaultResponseScalarDecoder

isPrivate :: SelectionSet Scope__RepositoryInfo Boolean
isPrivate = selectionForField "isPrivate" [] graphqlDefaultResponseScalarDecoder

isTemplate :: SelectionSet Scope__RepositoryInfo Boolean
isTemplate = selectionForField
             "isTemplate"
             []
             graphqlDefaultResponseScalarDecoder

licenseInfo :: forall r . SelectionSet
                          Scope__License
                          r -> SelectionSet
                               Scope__RepositoryInfo
                               (Maybe
                                r)
licenseInfo = selectionForCompositeField
              "licenseInfo"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lockReason :: SelectionSet Scope__RepositoryInfo (Maybe RepositoryLockReason)
lockReason = selectionForField
             "lockReason"
             []
             graphqlDefaultResponseScalarDecoder

mirrorUrl :: SelectionSet Scope__RepositoryInfo (Maybe Uri)
mirrorUrl = selectionForField "mirrorUrl" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__RepositoryInfo String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

nameWithOwner :: SelectionSet Scope__RepositoryInfo String
nameWithOwner = selectionForField
                "nameWithOwner"
                []
                graphqlDefaultResponseScalarDecoder

openGraphImageUrl :: SelectionSet Scope__RepositoryInfo Uri
openGraphImageUrl = selectionForField
                    "openGraphImageUrl"
                    []
                    graphqlDefaultResponseScalarDecoder

owner :: forall r . SelectionSet
                    Scope__RepositoryOwner
                    r -> SelectionSet
                         Scope__RepositoryInfo
                         r
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pushedAt :: SelectionSet Scope__RepositoryInfo (Maybe DateTime)
pushedAt = selectionForField "pushedAt" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__RepositoryInfo Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

type ShortDescriptionHtmlInputRowOptional r = ( limit :: Optional Int | r )

type ShortDescriptionHtmlInput = { | ShortDescriptionHtmlInputRowOptional + () }

shortDescriptionHTML :: ShortDescriptionHtmlInput -> SelectionSet
                                                     Scope__RepositoryInfo
                                                     Html
shortDescriptionHTML input = selectionForField
                             "shortDescriptionHTML"
                             (toGraphqlArguments
                              input)
                             graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__RepositoryInfo DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__RepositoryInfo Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

usesCustomOpenGraphImage :: SelectionSet Scope__RepositoryInfo Boolean
usesCustomOpenGraphImage = selectionForField
                           "usesCustomOpenGraphImage"
                           []
                           graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onRepository :: SelectionSet
                                             Scope__Repository
                                             decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__RepositoryInfo
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Repository" selections.onRepository ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onRepository: pure Nothing }
