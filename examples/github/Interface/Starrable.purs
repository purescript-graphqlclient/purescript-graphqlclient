module Examples.Github.Interface.Starrable where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Starrable
  , Scope__StargazerConnection
  , Scope__Gist
  , Scope__Repository
  , Scope__Topic
  )
import Examples.Github.Scalars (Id)
import Examples.Github.InputObject (StarOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Data.Maybe (Maybe(..))
import Prelude (pure)

id :: SelectionSet Scope__Starrable Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type StargazersInputRowOptional r = ( after :: Optional
                                               String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    , orderBy :: Optional
                                                 Examples.Github.InputObject.StarOrder
                                    | r
                                    )

type StargazersInput = { | StargazersInputRowOptional + () }

stargazers :: forall r . StargazersInput -> SelectionSet
                                            Scope__StargazerConnection
                                            r -> SelectionSet
                                                 Scope__Starrable
                                                 r
stargazers input = selectionForCompositeField
                   "stargazers"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerHasStarred :: SelectionSet Scope__Starrable Boolean
viewerHasStarred = selectionForField
                   "viewerHasStarred"
                   []
                   graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onGist :: SelectionSet
                                       Scope__Gist
                                       decodesTo
                           , onRepository :: SelectionSet
                                             Scope__Repository
                                             decodesTo
                           , onTopic :: SelectionSet Scope__Topic decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__Starrable
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "Gist"
                         selections.onGist
                       , buildFragment "Repository" selections.onRepository
                       , buildFragment "Topic" selections.onTopic
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onGist: pure
                           Nothing
                 , onRepository: pure
                                 Nothing
                 , onTopic: pure
                            Nothing
                 }
